extends Control

func _ready():
	$ksg_logo/Timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")
