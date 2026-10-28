extends StateClass

@onready var animation: AnimatedSprite2D = $"../../AnimatedSprite2D"
var player_speed: float

func enter(): 
	player_speed = owner_node.data.movement_speed
	
func physics_update(_delta):
	if Input.is_action_just_pressed("dodge") and not owner_node.is_dodging:
		Transition.emit(self, "dodge")
		return
		
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction == Vector2.ZERO:
		Transition.emit(self, "idle")

	owner_node.velocity = direction * player_speed
	
	if direction.x > 0:
		animation.flip_h = false
		animation.play("run")
	
	if direction.x < 0:
		animation.flip_h = true
		animation.play("run")
	
	owner_node.move_and_slide()
