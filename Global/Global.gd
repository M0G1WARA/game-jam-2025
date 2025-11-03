extends Node

var is_decorating = false

var options_visible: bool = false

var decoration_data = {} 

var next_id = 1

func get_new_id():
	next_id += 1
	return next_id - 1

var instanced_graves = []
var instanced_objects: Dictionary = {}

var camera_data = {
	"position": Vector2.ZERO,
	"zoom": Vector2.ONE
}

var light = 0.8


func save_game():
	var config = ConfigFile.new()
	config.set_value("Game", "is_decorating", is_decorating)
	config.set_value("Game", "options_visible", options_visible)
	config.set_value("Game", "decoration_data", decoration_data)
	config.set_value("Game", "next_id", next_id)
	config.set_value("Game", "instanced_graves", instanced_graves)
	config.set_value("Game", "instanced_objects", instanced_objects)
	config.set_value("Game", "camera_position", camera_data["position"])
	config.set_value("Game", "camera_zoom", camera_data["zoom"])
	config.set_value("Game", "light", light)
	config.save("user://savegame.cfg")

func load_game():
	var config = ConfigFile.new()
	config.load("user://savegame.cfg")
	if config.has_section("Game"):
		is_decorating = config.get_value("Game", "is_decorating", false)
		options_visible = config.get_value("Game", "options_visible", false)
		decoration_data = config.get_value("Game", "decoration_data", {})
		next_id = config.get_value("Game", "next_id", 1)
		instanced_graves = config.get_value("Game", "instanced_graves", [])
		instanced_objects = config.get_value("Game", "instanced_objects", {})
		camera_data["position"] = config.get_value("Game", "camera_position", Vector2.ZERO)
		camera_data["zoom"] = config.get_value("Game", "camera_zoom", Vector2.ONE)
		light = config.get_value("Game", "light", 0.8)

func has_savegame() -> bool:
	var file = FileAccess.open("user://savegame.cfg", FileAccess.READ)
	if file:
		file.close()
		var config = ConfigFile.new()
		config.load("user://savegame.cfg")
		if config.has_section("Game"):
			return true
	return false

func new_game():
	is_decorating = false
	options_visible = false
	decoration_data = {}
	next_id = 1
	instanced_graves = []
	instanced_objects = {}
	camera_data = {
		"position": Vector2.ZERO,
		"zoom": Vector2.ONE
	}
	light = 0.8
	
	#if has_savegame():
	#	DirAccess.remove_absolute("user://savegame.cfg")
