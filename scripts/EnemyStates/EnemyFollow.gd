extends StateClass
class_name EnemyFollow

@onready var enemy: CharacterBody2D = $"../.."

#Access player position from enemy
#put into physics_update to consistently track
#do enemy .direction_to() to follow position of player
#move 
var locate_player: Vector2

func enter():
	locate_player = enemy.global_position.direction_to(enemy.player_pos.global_position)
	
func exit():
	pass
	
func physics_update(_delta) -> void:
	if locate_player:
		enemy.velocity = locate_player * enemy.enemy_roam_speed
		
	print(locate_player)
	enemy.move_and_slide()

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
