extends Node2D

@export var angular_speed: int = 30 #degrees per second

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		rotate(deg_to_rad(angular_speed*delta))
	elif Input.is_action_pressed("move_right"):
		rotate(deg_to_rad(-angular_speed*delta))

func get_state() -> Dictionary:
	var state = {}
	for child in get_children():
		if child.is_in_group('stateful'):
			state[child.name] = child.get_state()
	
	return state

func set_state(state: Dictionary) -> void:
	for child in get_children():
		if child.is_in_group('stateful'):
			child.set_state(state[child.name])
