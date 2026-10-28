extends Node

@export var initial_state: StateClass
var current_state: StateClass
var all_states: Dictionary = {}

func _ready():
	register_states()
	if initial_state:
		current_state = initial_state
		current_state.enter()
	
func change_state(_state, new_state_name: String):
	var new_state = all_states.get(new_state_name.to_lower())
	
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()
	
func register_states() -> void:
	for child in get_children():
		if child is StateClass:
			all_states[child.name.to_lower()] = child
			child.Transition.connect(change_state)
			child.setup(get_parent())

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
