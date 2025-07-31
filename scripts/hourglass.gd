extends Node2D

enum SAND_STATES { TOP_FULL, TOP_HALF, TOP_EMPTY }
var sand_state = SAND_STATES.TOP_FULL
var state_names = ["sand_state"]

func get_state() -> Dictionary:
	var state = {}
	
	for state_name in state_names:
		state[state_name] = get(state_name)
	
	return state

func set_state(states: Dictionary) -> void:
	for state_name in states:
		set(state_name, states[state_name])
