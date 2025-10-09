extends CanvasLayer
@onready var transition = $transition

func play_transition():
	Char.set_process_input(false)
	Char.set_physics_process(false)
	Char.set_process(false)
	transition.visible = true
	transition.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(transition, "modulate:a", 1.0, 1.0)
	await tween.finished
	await get_tree().create_timer(1.5).timeout
	var tween_out = create_tween()
	tween_out.tween_property(transition, "modulate:a", 0.0, 1.0)
	await tween_out.finished
	transition.visible = false
	Char.set_process_input(true)
	Char.set_physics_process(true)
	Char.set_process(true)
