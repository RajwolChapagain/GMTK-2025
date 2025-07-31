extends Node

var initial_state

func _ready() -> void:
	%CameraAnimationPlayer.animation_started.connect(on_camera_animation_started)
	%CameraAnimationPlayer.animation_finished.connect(on_camera_animation_finished)
	%DayTimer.timeout.connect(on_day_timer_timeout)
	%UI.set_time_slider_max_value(%DayTimer.wait_time)
	initial_state = %World.get_state()
	%CameraAnimationPlayer.play("take_snapshot")
	
func _process(delta: float) -> void:
	%UI.set_time_slider_value(%DayTimer.wait_time - %DayTimer.time_left)
		
func get_snapshot() -> Texture2D:
	var img = %Camera2D.get_viewport().get_texture().get_image()
	return ImageTexture.create_from_image(img)
	
func is_same_state(state1, state2) -> bool:
	return state1 == state2
	
func reset_world(state) -> void:
	initial_state = state
	%DayTimer.start()
	%CameraAnimationPlayer.play("take_snapshot")
	
func on_day_timer_timeout() -> void:
	var final_state = %World.get_state()
	print()
	print('World state finalized at:')
	print(final_state)
	if is_same_state(initial_state, final_state):
		print('Game won!')
	else:
		reset_world(final_state)
		print('Loop')
		
func on_camera_animation_started(anim: String) -> void:
	if anim == "take_snapshot":
		%UI.visible = false
			
func on_camera_animation_finished(anim: String) -> void:
	if anim == "take_snapshot":
		%UI.set_snapshot(get_snapshot())
		%CameraAnimationPlayer.play("return_to_normal")
	if anim == "return_to_normal":
		%DayTimer.start()
		%UI.visible = true
