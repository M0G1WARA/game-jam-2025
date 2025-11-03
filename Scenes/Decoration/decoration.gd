extends Node2D


var object_scene = preload("res://Scenes/Object/object.tscn")
var current_id: int = -1


func _ready():
	set_data(Global.decoration_data)
	Transition.fade_in()
	await Transition.transition_finished

func set_data(data):
	current_id = data.get("id", -1)
	$Default/Graves.frame = data.get("frame_id", 0)
	Global.instanced_objects[current_id] = Global.instanced_objects.get(current_id, [])
	load_objects()

func save_objects():
	var grave_node = $Default/Graves
	if current_id == -1 or !Global.instanced_objects.has(current_id):
		return
	Global.instanced_objects[current_id] = []
	for child in get_children():
		if child.name == "Default":
			continue
		Global.instanced_objects[current_id].append([grave_node.to_local(child.global_position), child.get_image_id()])
	Transition.fade_out()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")

func load_objects():
	var grave_node = $Default/Graves
	var objetos = Global.instanced_objects.get(current_id, [])
	if objetos.is_empty() or current_id == -1:
		return
	
	for child_data in objetos:
		var new_object = object_scene.instantiate()
		new_object.position = grave_node.to_global(child_data[0])
		new_object.assign_image_by_id(child_data[1])
		add_child(new_object)
