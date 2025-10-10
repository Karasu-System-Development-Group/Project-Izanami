extends Control




func _on_back_to_main_screen_pressed():
	$backToMainScreen/SelectSound.play()
	TransitionManager.play_transition(0.5)
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")



func _on_back_to_main_screen_mouse_entered():
	pass # Replace with function body.



func _on_back_to_pressed():
	$backTo/SelectSound.play()
	TransitionManager.play_transition(0.5)
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/menu/about_screen.tscn")



func _on_back_to_mouse_entered():
	print("Mouse")
