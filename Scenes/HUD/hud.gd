extends CanvasLayer

@export var is_horizontal: bool = true

func _ready():
	if is_horizontal:
		$HPanel.show()
	else:
		$VPanel.show()
