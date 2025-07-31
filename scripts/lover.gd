extends Node2D

@export var state_names: Array[StringName]

@onready var emotional_state = %AnimatedSprite2D.frame:
	get:
		return emotional_state
	set(value):
		%AnimatedSprite2D.frame = value
		emotional_state = value

func _ready() -> void:
	%AnimatedSprite2D.frame_changed.connect(on_animation_frame_changed)
	
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

func interact() -> void:
	emotional_state = 0 if emotional_state == 1 else 1
	
func become_happy() -> void:
	emotional_state = 1

func become_sad() -> void:
	emotional_state = 0
	
func on_animation_frame_changed() -> void:
	emotional_state = %AnimatedSprite2D.frame

func on_crossed_noon() -> void:
	become_happy()
