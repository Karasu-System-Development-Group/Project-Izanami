extends Node2D

@onready var hover = $"../../HoverSound"
@onready var select = $"../../SelectSound"



func _on_yes_button_mouse_entered():
	if self.visible:
		hover.play()

func _on_yes_button_pressed():
	if self.visible:
		get_tree().quit()


func _on_no_button_mouse_entered():
	if self.visible:
		hover.play()

func _on_no_button_pressed():
	if self.visible:
		select.play()
		self.visible = false
