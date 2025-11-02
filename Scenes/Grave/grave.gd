extends StaticBody2D


var object_id: int

func _ready():
	object_id = Global.get_new_id()


func assign_image_by_id(texture_id: int):
	if texture_id <= 4:
		$Graves.frame = texture_id
	else:
		print("Error: ID de textura '", texture_id, "' fuera de rango.")


func _on_button_pressed():
	var data = {"id": object_id, "frame_id" : $Graves.frame }
	get_parent().get_parent().decoration_show(data)


func _on_area_2d_mouse_entered():
	$Button.show()


func _on_area_2d_mouse_exited():
	$Button.hide()
