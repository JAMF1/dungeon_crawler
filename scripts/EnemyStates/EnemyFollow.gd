extends StateClass

var player_direction: Vector2

func enter():
	pass
	
func exit():
	pass
	
func update(_delta):
	if owner_node.player_detected:
		player_direction = owner_node.global_position.direction_to(owner_node.current_player_pos)
	else:
		Transition.emit(self, "wander")

func physics_update(_delta) -> void:
	if player_direction:
		owner_node.velocity = player_direction * owner_node.data.chase_speed
	
	owner_node.move_and_slide()
