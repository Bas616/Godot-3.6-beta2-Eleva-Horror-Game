extends MeshInstance


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if event.pressed:
			$"../../../AnimationPlayer".play("a")
			
			
