extends Panel

@export var scene_to_instance: PackedScene
@export var preview_texture: Texture2D

var is_dragging := false
var preview: Sprite2D

func _ready():
	preview = Sprite2D.new()
	preview.texture = preview_texture
	preview.visible = false
	add_child(preview)

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
					new_instance.global_position = get_global_mouse_position()
					get_parent().add_child(new_instance)

	if event is InputEventMouseMotion and is_dragging:
		preview.global_position = get_global_mouse_position()
