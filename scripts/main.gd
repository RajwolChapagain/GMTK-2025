extends Node

func _ready() -> void:
	%CameraAnimationPlayer.play("take_snapshot")
	%CameraAnimationPlayer.connect("animation_finished", on_camera_animation_finished)
	
func on_camera_animation_finished(anim: String) -> void:
	if anim == "take_snapshot":
		var snapshot = take_snapshot()
		%UI.set_snapshot(snapshot)
		%CameraAnimationPlayer.play("return_to_normal")
		
func take_snapshot() -> Texture2D:
	var img = %Camera2D.get_viewport().get_texture().get_image()
	return ImageTexture.create_from_image(img)
