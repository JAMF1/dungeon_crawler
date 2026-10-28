extends StateClass

@onready var animation: AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter():
	animation.play("idle")
	
func physics_update(_delta):
	if Input.is_action_just_pressed("dodge") and not owner_node.is_dodging:
		Transition.emit(self.name, "dodge")
	
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		Transition.emit(self.name, "move")
