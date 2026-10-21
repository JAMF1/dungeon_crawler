extends Node

var current_state: StateClass

func _ready():
	current_state = $idle
	current_state.enter()
	
	
func change_state(new_state: StateClass):
	current_state.exit()
	current_state = new_state
	current_state.enter()

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
