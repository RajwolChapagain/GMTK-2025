extends Node

func _ready() -> void:
	%CameraAnimationPlayer.connect("animation_started", on_camera_animation_started)
	%CameraAnimationPlayer.connect("animation_finished", on_camera_animation_finished)
	%CameraAnimationPlayer.play("take_snapshot")

func on_camera_animation_started(anim: String) -> void:
	if anim == "take_snapshot":
		%UI.visible = false
			
func on_camera_animation_finished(anim: String) -> void:
	if anim == "take_snapshot":
		%UI.set_snapshot(get_snapshot())
		%CameraAnimationPlayer.play("return_to_normal")
	if anim == "return_to_normal":
		%UI.visible = true
		
func get_snapshot() -> Texture2D:
	var img = %Camera2D.get_viewport().get_texture().get_image()
	return ImageTexture.create_from_image(img)
