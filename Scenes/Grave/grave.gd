extends StaticBody2D


var player_inside := false
var object_id: int

func _ready():
	object_id = Global.get_new_id()

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
		var data = {"id": object_id, "frame_id" : $Graves.frame }
		get_parent().get_parent().decoration_show(data)

func assign_image_by_id(texture_id: int):
	if texture_id <= 4:
		$Graves.frame = texture_id
	else:
		print("Error: ID de textura '", texture_id, "' fuera de rango.")
