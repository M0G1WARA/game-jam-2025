extends CharacterBody2D

@export var speed = 400

func get_input():
	if not Global.is_decorating:
		var input_direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
		velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func toogle_camera(value: bool):
	$Camera2D.enabled = value
