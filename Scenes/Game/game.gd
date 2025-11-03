extends Node2D


var grave_scene = preload("res://Scenes/Grave/grave.tscn")

func _ready():
	load_objects()
	Transition.fade_in()
	await Transition.transition_finished
	

func save_objects():
	if Global.next_id == 1:
		return
	Global.instanced_graves = []
	for child in $Node2D.get_children():
		Global.instanced_graves.append([child.position, child.get_image_id(), child.get_id()])
	
	get_tree().change_scene_to_file("res://Scenes/Decoration/decoration.tscn")

func load_objects():
	if Global.instanced_graves.is_empty():
		return
	
	for child_data in Global.instanced_graves:
		var new_object = grave_scene.instantiate()
		new_object.position = child_data[0]
		new_object.assign_image_by_id(child_data[1])
		new_object.set_id(child_data[2])
		$Node2D.add_child(new_object)
