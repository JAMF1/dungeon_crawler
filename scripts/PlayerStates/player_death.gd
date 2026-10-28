extends StateClass 

@onready var animation: AnimatedSprite2D = $"../../AnimatedSprite2D"

var counter: float = 1.5

func enter() -> void:
	owner_node.velocity = Vector2.ZERO
	animation.play("death")

func update(delta) -> void:
	counter -= delta
	if counter <= 0:
		owner_node.queue_free()
	return
