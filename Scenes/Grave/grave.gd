extends StaticBody2D


var object_id: int
var object_scene = preload("res://Scenes/Object/object.tscn")

func assign_image_by_id(texture_id: int):
	if texture_id <= 4:
		$Graves.frame = texture_id
	else:
		print("Error: ID de textura '", texture_id, "' fuera de rango.")


func _on_button_pressed():
	Global.decoration_data = {"id": object_id, "frame_id": $Graves.frame}
	get_parent().get_parent().save_objects()


func _on_area_2d_mouse_entered():
	$Button.show()


func _on_area_2d_mouse_exited():
	$Button.hide()


func get_image_id()->int:
	return $Graves.frame

func get_id()->int:
	return object_id
	
func set_id(id = Global.get_new_id()):
	object_id = id
	load_objects()
	
func load_objects():
	var grave_node= $Graves
	var objetos = Global.instanced_objects.get(object_id, [])
	if objetos.is_empty():
		return
	
	for child_data in objetos:
		var new_object = object_scene.instantiate()
		new_object.position  = grave_node.position + Vector2(child_data[0])
		new_object.scale.x = 0.7
		new_object.scale.y = 0.7
		new_object.assign_image_by_id(child_data[1])
		add_child(new_object)
