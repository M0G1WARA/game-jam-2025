extends CanvasLayer

signal transition_finished

@onready var anim_player = $AnimationPlayer
@onready var music = $AudioStreamPlayer2D

func fade_in() -> void:
	anim_player.play("fade_in")
	await anim_player.animation_finished
	emit_signal("transition_finished")

func fade_out() -> void:
	anim_player.play("fade_out")
	await anim_player.animation_finished
	emit_signal("transition_finished")

func play_music():
	music.play()
