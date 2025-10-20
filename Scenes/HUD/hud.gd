extends CanvasLayer

@export var is_horizontal: bool = true

func _ready():
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
