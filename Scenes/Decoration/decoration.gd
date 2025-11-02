extends Node2D

var instanced_children: Dictionary = {}
var object_scene = preload("res://Scenes/Object/object.tscn")
var current_id: int = -1


func _ready():
	set_data(Global.decoration_data)

func set_data(data):
	current_id = data.get("id", -1)
	$Default/Graves.frame = data.get("frame_id", 0)
	instanced_children[current_id] = instanced_children.get(current_id, [])
	clear_objects()
	await get_tree().process_frame
	load_objects()

func clear_objects():
	for child in get_children():
		if child.name == "Default":
			continue
		child.queue_free()

func save_objects():
	if current_id == -1 or !instanced_children.has(current_id):
		return
	instanced_children[current_id] = []
	for child in get_children():
		if child.name == "Default":
			continue
		instanced_children[current_id].append([child.position, child.get_image_id()])
	
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")

func load_objects():
	var objetos = instanced_children.get(current_id, [])
	if objetos.is_empty() or current_id == -1:
		return
	
	for child_data in objetos:
		var new_object = object_scene.instantiate()
		new_object.position = child_data[0]
		new_object.assign_image_by_id(child_data[1])
		add_child(new_object)
