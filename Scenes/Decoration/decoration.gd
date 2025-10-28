extends Node2D

var instanced_children: Dictionary = {}
var object_scene = preload("res://Scenes/Object/object.tscn")
var current_id: int = -1


func _ready():
	self.visibility_changed.connect(_on_visibility_changed)

func set_data(data):
	current_id = data.get("id", -1)
	instanced_children[current_id] = instanced_children.get(current_id, [])

func clear_objects():
	for child in get_children():
		if child.name == "ColorRect" or child.name == "Graves":
			continue
		child.queue_free()

func save_objects():
	if current_id == -1 or !instanced_children.has(current_id):
		return
	instanced_children[current_id] = []
	for child in get_children():
		if child.name == "ColorRect" or child.name == "Graves":
			continue
		instanced_children[current_id].append([child.position, child.get_image_id()])

func load_objects():
	var objetos = instanced_children.get(current_id, [])
	if objetos.is_empty() or current_id == -1:
		return
	
	for child_data in objetos:
		var new_object = object_scene.instantiate()
		new_object.position = child_data[0]
		new_object.assign_image_by_id(child_data[1])
		add_child(new_object)


func _on_visibility_changed():
	if visible:
		Global.is_decorating = true
		get_owner().get_node("Player").toogle_camera(false)
		clear_objects()
		await get_tree().process_frame
		load_objects()
	else:
		Global.is_decorating = false
		get_owner().get_node("Player").toogle_camera(true)
		save_objects()
