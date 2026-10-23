extends StateClass
class_name	EnemyWander


@onready var timer: Timer = $Timer
@onready var detection: Area2D = $"../../Detection"
@onready var enemy: CharacterBody2D = $"../.."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"


func enter():
	randomized_wander()
	if enemy.enemy_direction.x > 0:
		animated_sprite_2d.play("walk_right")
	else:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("walk_right")
		
	if enemy.enemy_direction.y < 0:
		animated_sprite_2d.play("walk_up")
	else: 
		animated_sprite_2d.play("walk_down")
	
	timer.start(2.0)
	
	
func exit():
	timer.stop()
	
	
func randomized_wander():
	enemy.enemy_direction = Vector2(randf_range(-5, 5), randf_range(-5, 5)).normalized()
	
	
func _on_timer_timeout() -> void:
	get_parent().change_state($"../idle")
	
	
func update(_delta):
	pass
	
	
func physics_update(_delta):
	enemy.velocity = enemy.enemy_direction * enemy.enemy_roam_speed
	enemy.move_and_slide()
	
