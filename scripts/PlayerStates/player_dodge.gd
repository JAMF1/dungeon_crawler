extends StateClass

@onready var player: CharacterBody2D = $"../.."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var dodge_speed: float = 50.0
var dodge_direction: Vector2

func enter():
	dodge_direction = Input.get_vector("left", "right", "up", "down")
	animated_sprite_2d.play("dodge")
	print("dodge direction: ", dodge_direction)
	
	if dodge_direction == Vector2.ZERO:
		if animated_sprite_2d.flip_h:
			dodge_direction = Vector2.LEFT
		else:
			dodge_direction = Vector2.RIGHT	

	
	
func process_update(_delta):
	pass
	
func physics_update(_delta):
	player.velocity = dodge_direction * dodge_speed
	player.move_and_slide()

func exit():
	player.velocity = Vector2.ZERO
		
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "dodge":
		get_parent().change_state($"../idle")
		
	
	
