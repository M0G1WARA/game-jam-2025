extends StaticBody2D

@onready var object_image = $TextureRect as TextureRect

@export var available_textures: Array[Texture2D] = []

func _ready():
	assign_image_by_id(0)
	
	object_image.custom_minimum_size = Vector2(128, 128)
	object_image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	object_image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED

func assign_image_by_id(texture_id: int):
	if texture_id >= 0 and texture_id < available_textures.size():
		object_image.texture = available_textures[texture_id]
	else:
		print("Error: ID de textura '", texture_id, "' fuera de rango.")
