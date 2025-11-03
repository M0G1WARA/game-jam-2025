extends Control

func _ready():
	if Global.has_savegame():
		$VBoxContainer/Button2.show()
		$VBoxContainer/Button.text = "Nuevo juego"
	Transition.fade_in()
	await Transition.transition_finished

func _on_button_pressed():
	Global.new_game()
	Transition.play_music()
	Transition.fade_out()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")


func _on_button_2_pressed():
	Global.load_game()
	Transition.fade_out()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")


func _on_button_3_pressed():
	Transition.fade_out()
	await Transition.transition_finished
	get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")
