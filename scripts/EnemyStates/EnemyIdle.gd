extends StateClass

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var idle_time: float 

func enter():
	randomize_idle_time()
	owner_node.velocity = Vector2.ZERO
	
	if owner_node.direction.x > 0:
		animated_sprite_2d.play("idle_right")
	
	if owner_node.direction.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("idle_right")
	
func update(delta):
	if owner_node.player_detected:
		Transition.emit(self, "follow")
		
	if idle_time > 0:
		idle_time -= delta
	else:
		Transition.emit(self, "wander")
		
func physics_update(_delta: float):
	pass
	
func randomize_idle_time() -> void:
	idle_time = randf_range(1,3)

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
