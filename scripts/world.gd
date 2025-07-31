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

	var normalized_angle = int(rotation_degrees) % 360
	if normalized_angle < 0:
		normalized_angle = 360 + normalized_angle
	
	var sector = floori(normalized_angle / 36)
	state['world'] = {'sector': sector}
	return state

func set_state(state: Dictionary) -> void:
	for child in get_children():
		if child.is_in_group('stateful'):
			child.set_state(state[child.name])

func on_crossed_noon() -> void:
	for child in get_children():
		if child.has_method('on_crossed_noon'):
			child.on_crossed_noon()
