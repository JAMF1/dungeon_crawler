extends CharacterBody2D

var speed: int = 300
var is_dodging = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if is_dodging == false:
		if input_direction == Vector2.ZERO:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")

		if input_direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif input_direction.x > 0:
			$AnimatedSprite2D.flip_h = false
			
	if Input.is_action_just_pressed("dodge"):
		is_dodging = true
		$AnimatedSprite2D.play("dodge")

	velocity = input_direction * speed
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "dodge":
		is_dodging = false
		
func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
