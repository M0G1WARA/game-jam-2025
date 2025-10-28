extends StaticBody2D

var image_id = 0
var light_objects = [1]

func assign_image_by_id(texture_id: int):
	if texture_id <= 31:
		image_id = texture_id
		$Elements.frame = texture_id
		if texture_id in light_objects:
			$PointLight2D.show()
	else:
		print("Error: ID de textura '", texture_id, "' fuera de rango.")

func get_image_id()->int:
	return image_id

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if Global.options_visible:
				$Button.show()
			else:
				$Button.hide()


func _on_button_pressed():
	queue_free()
