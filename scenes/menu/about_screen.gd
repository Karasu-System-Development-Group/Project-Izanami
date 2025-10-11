extends Control
@onready var hoverSound: AudioStreamPlayer = $HoverSound 




func _on_aditional_info_pressed():
	$aditionalInfo/SelectSound.play()
	TransitionManager.play_transition(0.5)
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/menu/aditional_info.tscn")

func _on_aditional_info_mouse_entered():
	hoverSound.play()




func _on_back_pressed():
	$aditionalInfo/SelectSound.play()
	TransitionManager.play_transition(0.5)
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")


func _on_back_mouse_entered():
	hoverSound.play()


func _on_tree_entered():
	pass # Replace with function body.
