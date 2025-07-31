extends Node2D

@export var angular_speed: int = 30 #degrees per second

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		rotate(deg_to_rad(angular_speed*delta))
	elif Input.is_action_pressed("move_right"):
		rotate(deg_to_rad(-angular_speed*delta))
