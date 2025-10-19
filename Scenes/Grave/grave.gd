extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		$Label.show()


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		$Label.hide()
