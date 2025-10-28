extends CanvasLayer

@export var is_horizontal: bool = true
const OBJECT_PANEL_SCENE = preload("res://Scenes/ObjectPanel/object_panel.tscn")


var scene_to_instance_grave = preload("res://Scenes/Grave/grave.tscn")
var graves = 4

var scene_to_instance_object = preload("res://Scenes/Object/object.tscn")
var objects = 2

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
	for i in range(graves):
		var new_panel = OBJECT_PANEL_SCENE.instantiate()
		new_panel.frame_index = i
		new_panel.scene_to_instance = scene_to_instance_grave
		flow_containerH.add_child(new_panel)

	for i in range(objects):
		var new_panel = OBJECT_PANEL_SCENE.instantiate()
		new_panel.frame_index = i
		new_panel.scene_to_instance = scene_to_instance_object
		flow_containerV.add_child(new_panel)


func _on_v_slider_value_changed(value):
	get_owner().get_node("Light").color = Color(value, value, value, 255)
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			Global.options_visible = not Global.options_visible
