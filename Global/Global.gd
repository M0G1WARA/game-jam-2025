extends Node

var next_id = 1

func get_new_id():
	next_id += 1
	return next_id - 1
