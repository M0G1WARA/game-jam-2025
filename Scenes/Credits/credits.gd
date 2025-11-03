extends Control


func _ready():
	Transition.fade_in()
	await Transition.transition_finished


func _on_button_pressed():
	Transition.fade_out()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Scenes/MainMenu/main_menu.tscn")
