extends Control

func set_snapshot(snap: Texture2D) -> void:
	%Snapshot.texture = snap

func set_time_slider_max_value(value) -> void:
	%TimeSlider.max_value = value
	
func set_time_slider_value(value) -> void:
	%TimeSlider.value = value
