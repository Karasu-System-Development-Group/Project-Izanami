extends Node2D


@onready var letterText = $letterObject/Node2D/letterText
@onready var letter =$letterObject/Node2D


@export var isLetterVisible = true

func fade_in(duration=1.0):
	letter.modulate.a = 0
	letter.visible = true
	var tween = create_tween()
	tween.tween_property(letter, "modulate:a", 1, duration)

func fade_out(duration=1.0):
	var tween = create_tween()
	tween.tween_property(letter, "modulate:a", 0, duration)
	await tween.finished
	letter.visible = false

func writeOnLetter(text):
	letterText.text = text
	
func show_message(text):
	Char.canMove(false)
	TransitionManager.play_audio_transition($letterObject/Node2D/letterSound, -1, 2.0)
	await self.writeOnLetter(text)
	await self.fade_in()

func _on_close_button_pressed():
	if letter.visible:
		fade_out()
		Char.canMove(true)
