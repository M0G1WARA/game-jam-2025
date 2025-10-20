extends StaticBody2D


var player_inside := false

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		$Label.show()
		player_inside = true


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		$Label.hide()
		player_inside = false


func _input(event):
	if event.is_action_pressed("ui_accept") and player_inside:
		get_tree().change_scene_to_file("res://Scenes/Decoration/decoration.tscn")
