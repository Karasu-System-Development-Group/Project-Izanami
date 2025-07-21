extends TextureButton

@onready var hoverSound: AudioStreamPlayer = $PaperFlip 

func _on_mouse_entered():
	hoverSound.play()
