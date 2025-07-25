extends VBoxContainer
@onready var hoverSound: AudioStreamPlayer = $HoverSound 
@onready var selectSound: AudioStreamPlayer = $SelectSound 
@onready var quitDialog: ConfirmationDialog = $Quit/QuitDialog



func _on_new_game_pressed():
	print(2)
	selectSound.play()
	get_tree().change_scene_to_file("res://scenes/game/house/house.tscn")

	
	
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
	get_tree().change_scene_to_file("res://scenes/menu/about_screen.tscn")


func _on_about_mouse_entered():
	hoverSound.play()


## QUIT ##

func _on_quit_pressed():
	quitDialog.popup_centered()
	selectSound.play()
	
func _on_quit_mouse_entered():
	hoverSound.play()


func _on_quit_dialog_confirmed():
	get_tree().quit()
