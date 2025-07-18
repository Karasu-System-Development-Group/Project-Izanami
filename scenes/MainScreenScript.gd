extends VBoxContainer
@onready var hoverSound: AudioStreamPlayer = $HoverSound 
@onready var selectSound: AudioStreamPlayer = $SelectSound 


func _on_new_game_pressed():
	print(2)
	selectSound.play()
	
	
func _on_new_game_mouse_entered():
	hoverSound.play()


## SETTINGS ##	
func _on_settings_pressed():
	print(2)
	selectSound.play()

func _on_settings_mouse_entered():
	hoverSound.play()

	

## ABOUT ##

func _on_about_pressed():
	print(2)
	selectSound.play()

func _on_about_mouse_entered():
	hoverSound.play()


## QUIT ##

func _on_quit_pressed():
	selectSound.play()
	get_tree().quit()
	
func _on_quit_mouse_entered():
	hoverSound.play()
