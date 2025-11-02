extends Node

var is_decorating = false

var options_visible: bool = false

var decoration_data = {} 

var next_id = 1

func get_new_id():
	next_id += 1
	return next_id - 1
