extends Panel
@onready var pause_menu = $"."

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		pause_menu.visible = !pause_menu.visible


func _on_button_pressed():
	pause_menu.visible = !pause_menu.visible
