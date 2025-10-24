extends CanvasLayer

@export var is_horizontal: bool = true
const OBJECT_PANEL_SCENE = preload("res://Scenes/ObjectPanel/object_panel.tscn")

var panel_data_h = [
	{
		"scene_to_instance": preload("res://Scenes/Grave/grave.tscn"),
		"preview_texture": preload("res://Assets/Images/grave.png")
	},
	{
		"scene_to_instance": preload("res://Scenes/Grave/grave.tscn"),
		"preview_texture": preload("res://Assets/Images/grave.png")
	},
]

var panel_data_v = [
	{
		"scene_to_instance": preload("res://Scenes/Object/object.tscn"),
		"preview_texture": preload("res://Assets/Images/flor.png")
	},
	{
		"scene_to_instance": preload("res://Scenes/Object/object.tscn"),
		"preview_texture": preload("res://Assets/Images/flor.png")
	},
]

@onready var flow_containerH = $MarginContainer/HPanel/FlowContainer
@onready var flow_containerV = $MarginContainer/VPanel/FlowContainer

func _ready():
	create_object_panels()
	
	if is_horizontal:
		$MarginContainer/HPanel.show()
	else:
		$MarginContainer/VPanel.show()
		$MarginContainer/BackButton.show()


func _on_back_button_pressed():
	get_owner().decoration_hide()

func toggle():
	is_horizontal = !is_horizontal
	if is_horizontal:
		$MarginContainer/HPanel.show()
		$MarginContainer/VPanel.hide()
		$MarginContainer/BackButton.hide()
	else:
		$MarginContainer/HPanel.hide()
		$MarginContainer/VPanel.show()
		$MarginContainer/BackButton.show()

func create_object_panels():
	for data in panel_data_h:
		var new_panel = OBJECT_PANEL_SCENE.instantiate()
		new_panel.scene_to_instance = data.scene_to_instance
		new_panel.preview_texture = data.preview_texture
		flow_containerH.add_child(new_panel)

	for data in panel_data_v:
		var new_panel = OBJECT_PANEL_SCENE.instantiate()
		new_panel.scene_to_instance = data.scene_to_instance
		new_panel.preview_texture = data.preview_texture
		flow_containerV.add_child(new_panel)
