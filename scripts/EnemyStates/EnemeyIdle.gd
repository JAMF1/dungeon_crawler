extends StateClass
class_name EnemyIdle


@onready var timer: Timer = $Timer
@onready var wander: EnemyWander = $"../wander"
@onready var enemy: CharacterBody2D = $"../.."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"



func enter():
	enemy.velocity = Vector2.ZERO
	if wander.enemy_direction.x > 0:
		animated_sprite_2d.play("idle_right")
	
	if wander.enemy_direction.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("idle_right")
	timer.start(2.0)
	
	print("Enemy is Idle")

func exit():
	timer.stop()

func physics_update(_delta: float):
	pass

func _on_timer_timeout() -> void:
	get_parent().change_state($"../wander")










































#@export var enemy: CharacterBody2D
#@export var move_speed: float = 100.0
#var player: CharacterBody2D
#var move_direction: Vector2 
#var wander_time: float
#
#
#func randomize_wander() -> void:
	#move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	#wander_time = randf_range(1,3)
	#
#
#func Enter() -> void:
	#player = get_tree().get_first_node_in_group("player")
	#randomize_wander()
#
#func Update(delta: float):
	#if wander_time > 0:
		#wander_time -= delta
	#else:
		#randomize_wander()
		#
#func Physics_Update(_delta: float):
	#if enemy:
		#enemy.velocity = move_direction * move_speed
	#var direction = player.global_position - enemy.global_position
	#if direction.length() > 50:
		#Transition.emit(self,"Follow")
