extends Panel

@export var scene_to_instance: PackedScene
@export var preview_texture: Texture2D

@onready var preview_image = $TextureRect as TextureRect

var is_dragging := false
var preview: Sprite2D

func _ready():
	if preview_texture != null:
		preview_image.texture = preview_texture
		preview_image.custom_minimum_size = Vector2(128, 128)
		preview_image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		preview_image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	else:
		$Icon.show()
		$TextureRect.hide()
	
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
					if get_parent().get_parent().name == "HPanel":
						get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Node2D").add_child(new_instance)
					else:
						get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Decoration").add_child(new_instance)

	if event is InputEventMouseMotion and is_dragging:
		preview.global_position = get_global_mouse_position()
