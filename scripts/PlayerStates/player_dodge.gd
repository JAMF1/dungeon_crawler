extends StateClass

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var dodge_speed: float
var dodge_direction: Vector2

func enter():
	owner_node.is_dodging = true 
	dodge_speed = owner_node.data.dodge_speed
	dodge_direction = Input.get_vector("left", "right", "up", "down")
	animated_sprite_2d.play("dodge")
	
	if dodge_direction == Vector2.ZERO:
		if animated_sprite_2d.flip_h:
			dodge_direction = Vector2.LEFT
		else:
			dodge_direction = Vector2.RIGHT

func physics_update(_delta):
	owner_node.velocity = dodge_direction * dodge_speed
	owner_node.move_and_slide()

func exit():
	owner_node.velocity = Vector2.ZERO
	owner_node.is_dodging = false
		
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "dodge":
		Transition.emit(self, "idle")
