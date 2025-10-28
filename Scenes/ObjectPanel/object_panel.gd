extends Panel

@export var scene_to_instance: PackedScene
@export var frame_index: int

var is_dragging := false
var preview: Sprite2D


func _ready():
	if get_parent().get_parent().name == "HPanel":
		$Graves.show()
		$Graves.frame = frame_index
		preview = $Graves.duplicate()

	else:
		$Elements.show()
		$Elements.frame = frame_index
		preview = $Elements.duplicate()
		
	add_child(preview)
	preview.visible = false

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and get_global_rect().has_point(get_global_mouse_position()):
				is_dragging = true
				preview.visible = true
			else:
				if is_dragging:
					is_dragging = false
					preview.visible = false
					var new_instance = scene_to_instance.instantiate()
					if get_parent().get_parent().name == "HPanel":
						new_instance.global_position = get_viewport().get_canvas_transform().affine_inverse() * get_viewport().get_mouse_position()
						new_instance.assign_image_by_id(frame_index)
						get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Node2D").add_child(new_instance)
					else:
						new_instance.global_position = get_global_mouse_position()
						new_instance.assign_image_by_id(frame_index)
						get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Decoration").add_child(new_instance)

	if event is InputEventMouseMotion and is_dragging:
		preview.global_position = get_global_mouse_position()
