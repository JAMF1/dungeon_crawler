extends StateClass

var player_location: Vector2

func enter():
	pass
	
func exit():
	pass
	
func update(_delta):
	player_location = owner_node.global_position.direction_to(owner_node.current_player_pos)
	

func physics_update(_delta) -> void:
	if player_location:
		owner_node.velocity = player_location * owner_node.data.chase_speed
	
	owner_node.move_and_slide()
