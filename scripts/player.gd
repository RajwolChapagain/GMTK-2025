extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact_with_overlapping_objects()
		
func interact_with_overlapping_objects() -> void:
	for area in %InteractArea.get_overlapping_areas():
		if area.has_method("interact"):
			area.interact()
