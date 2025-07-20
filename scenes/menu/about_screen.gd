extends Control
@onready var hoverSound: AudioStreamPlayer = $HoverSound 
@onready var selectSound: AudioStreamPlayer = $SelectSound 



func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")


func _on_back_mouse_entered():
	hoverSound.play()
