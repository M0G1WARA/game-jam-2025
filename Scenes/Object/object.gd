extends StaticBody2D

@onready var object_image = $TextureRect as TextureRect


func _ready():
	assign_image_by_id(0)

func assign_image_by_id(texture_id: int):
	if texture_id <= 31:
		$Elements.frame = texture_id
	else:
		print("Error: ID de textura '", texture_id, "' fuera de rango.")
