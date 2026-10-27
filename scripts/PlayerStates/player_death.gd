extends StateClass 

@onready var animation: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: CharacterBody2D = $"../.."


var counter: float = 1.5

func enter() -> void:
	player.velocity = Vector2.ZERO
	animation.play("death")
	
	
func exit() -> void:
	pass
	
func update(delta) -> void:
	counter -= delta
	if counter <= 0:
		player.queue_free()
	return
	
func physics_update(_delta) -> void:
	pass
