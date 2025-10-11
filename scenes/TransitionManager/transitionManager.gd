extends CanvasLayer
@onready var transition = $transition

func play_transition(totalTime:=1.5):
	Char.set_process_input(false)
	Char.set_physics_process(false)
	Char.set_process(false)
	transition.visible = true
	transition.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(transition, "modulate:a", 1.0, 1.0)
	await tween.finished
	await get_tree().create_timer(totalTime).timeout
	var tween_out = create_tween()
	tween_out.tween_property(transition, "modulate:a", 0.0, 1.0)
	await tween_out.finished
	transition.visible = false
	Char.set_process_input(true)
	Char.set_physics_process(true)
	Char.set_process(true)


func play_audio_transition(audio_player, play_time: float = 5.0, fade_time: float = 2.0):
	audio_player.volume_db = -40
	audio_player.play()
	var tween := create_tween()
	tween.tween_property(audio_player, "volume_db", 0, fade_time)
	await tween.finished

	await get_tree().create_timer(play_time).timeout

	tween = create_tween()
	tween.tween_property(audio_player, "volume_db", -40, fade_time)
	await tween.finished
	audio_player.stop()
