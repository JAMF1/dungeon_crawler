extends StateClass
class_name EnemyFollow

@onready var enemy: CharacterBody2D = $"../.."

var player_location: Vector2

func enter():
	pass
	
func exit():
	pass
	
	
func update(_delta):
	player_location = enemy.global_position.direction_to(enemy.current_player_pos)
	

func physics_update(_delta) -> void:
	if player_location:
		enemy.velocity = player_location * enemy.enemy_roam_speed
	
	enemy.move_and_slide()

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
