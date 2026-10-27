extends StateClass

@onready var animation: AnimatedSprite2D = $"../../AnimatedSprite2D"


func enter():
	animation.play("idle")
	
func exit():
	pass
	
func process_update(_delta):
	pass
	
func physics_update(_delta):
	if Input.is_action_just_pressed("dodge"):
		get_parent().change_state($"../dodge")
		return
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		get_parent().change_state($"../move")
