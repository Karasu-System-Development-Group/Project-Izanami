extends VBoxContainer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer  # Assuming AudioStreamPlayer is a child of this node


func _on_new_game_pressed():
	pass # Replace with function body.
	
func _on_new_game_mouse_entered():
	audio_stream_player.play()
	

func _on_about_pressed():
	pass # Replace with function body.

func _on_about_mouse_entered():
	audio_stream_player.play()

func _on_quit_pressed():
	get_tree().quit()
	
func _on_quit_mouse_entered():
	audio_stream_player.play()
