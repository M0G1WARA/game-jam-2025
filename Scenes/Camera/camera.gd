extends Camera2D

@export var move_speed: float = 300.0
@export var zoom_speed: float = 0.1
@export var min_zoom: Vector2 = Vector2(0.4, 0.4)
@export var max_zoom: Vector2 = Vector2(4.0, 4.0)

func _ready():
	load_position()

func _process(delta):
	var input_dir = Vector2.ZERO

	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_dir = input_dir.normalized()

	position += input_dir * move_speed * delta

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(zoom_speed, zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(zoom_speed, zoom_speed)
			
	zoom = zoom.clamp(min_zoom, max_zoom)

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		save_position()

func load_position():
	if Global.camera_data["position"] != Vector2.ZERO or Global.camera_data["zoom"] != Vector2.ONE:
		position = Global.camera_data["position"]
		zoom = Global.camera_data["zoom"]

func save_position():
	Global.camera_data["position"] = position
	Global.camera_data["zoom"] = zoom
