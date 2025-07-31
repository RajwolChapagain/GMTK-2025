extends Node2D

@export var state_names: Array[StringName]

enum SAND_STATES { TOP_FULL, TOP_HALF, TOP_EMPTY }
var sand_state = SAND_STATES.TOP_FULL

func get_state() -> Dictionary:
	var state = {}
	
	for state_name in state_names:
		var value = get(state_name)
		if value != null:
			state[state_name] = value
		else:
			printerr('Error: state "' + state_name + '" not found in ' + name)
	
	return state

func set_state(states: Dictionary) -> void:
	for state_name in states:
		set(state_name, states[state_name])
