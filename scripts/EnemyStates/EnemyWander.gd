extends StateClass

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var wonder_time: float 

func enter():
	randomized_wander()
	
	if owner_node.direction.x > 0:
		animated_sprite_2d.play("walk_right")
	else:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("walk_right")
		
	if owner_node.direction.y < 0:
		animated_sprite_2d.play("walk_up")
	else: 
		animated_sprite_2d.play("walk_down")
	
func randomized_wander():
	owner_node.direction =  Vector2(randf_range(-5, 5), randf_range(-5, 5)).normalized()
	wonder_time = randf_range(1,3)
	
func update(delta):
	if owner_node.player_detected:
		Transition.emit(self, "follow")
		
	if wonder_time > 0:
		wonder_time -= delta
	else:
		Transition.emit(self,"idle")
	
func physics_update(_delta):
	owner_node.velocity = owner_node.direction * owner_node.data.roam_speed
	owner_node.move_and_slide()
