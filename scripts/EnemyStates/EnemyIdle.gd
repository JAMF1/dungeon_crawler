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
	
func randomize_idle_time() -> void:
	idle_time = randf_range(1,3)
