extends CanvasLayer

@export var is_horizontal: bool = true
const OBJECT_PANEL_SCENE = preload("res://Scenes/ObjectPanel/object_panel.tscn")

var panel_data_h = [
	{
		"scene_to_instance": preload("res://Scenes/Grave/grave.tscn"),
	},
	{
		"scene_to_instance": preload("res://Scenes/Grave/grave.tscn"),
	},
]

var panel_data_v = [
	{
		"scene_to_instance": preload("res://Scenes/Object/object.tscn"),
	},
	{
		"scene_to_instance": preload("res://Scenes/Object/object.tscn"),
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
	for i in range(panel_data_h.size()):
		var new_panel = OBJECT_PANEL_SCENE.instantiate()
		var data = panel_data_h[i]
		new_panel.frame_index = i
		new_panel.scene_to_instance = data.scene_to_instance
		flow_containerH.add_child(new_panel)

	for i in range(panel_data_v.size()):
		var new_panel = OBJECT_PANEL_SCENE.instantiate()
		new_panel.frame_index = i
		var data = panel_data_v[i]
		new_panel.scene_to_instance = data.scene_to_instance
		flow_containerV.add_child(new_panel)


func _on_v_slider_value_changed(value):
	get_owner().get_node("Light").color = Color(value, value, value, 255)
