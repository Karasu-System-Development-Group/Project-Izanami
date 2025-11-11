extends CanvasLayer

@onready var moveChange = true

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		$pauseOverlay.visible = !$pauseOverlay.visible
		print('esc apertado')


func _on_continue_button_pressed():
	if $pauseOverlay.visible:
		get_tree().paused = !get_tree().paused
		$pauseOverlay.visible = !$pauseOverlay.visible


func _on_exit_button_pressed():
	if $pauseOverlay.visible:
		get_tree().paused = !get_tree().paused
		$pauseOverlay.visible = !$pauseOverlay.visible
		TransitionManager.play_transition(2.0)
		await get_tree().create_timer(2.0).timeout
		Char.visible = false
		Char.camera.visible = false
		get_tree().change_scene_to_file("res://scenes/main_screen.tscn")
