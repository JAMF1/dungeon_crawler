extends StateClass

@onready var player: CharacterBody2D = $"../.."
@onready var animation: AnimatedSprite2D = $"../../AnimatedSprite2D"

var player_speed: float = 100.0


func enter(): 
	pass	
	
func exit():
	pass

func process_update(_delta):
	pass	
	
func physics_update(_delta):
	if Input.is_action_just_pressed("dodge"):
		get_parent().change_state($"../dodge")
		return
		
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction == Vector2.ZERO:
		get_parent().change_state($"../idle")

	player.velocity = direction * player_speed
	
	if direction.x > 0:
		animation.flip_h = false
		animation.play("run")
	
	if direction.x < 0:
		animation.flip_h = true
		animation.play("run")
	
	player.move_and_slide()
	
