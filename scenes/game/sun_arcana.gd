extends NinePatchRect

var moon = preload("res://assets/arcanas/monochrome/19.png")
var original_texture

func _ready():
	original_texture = texture

func _on_mouse_entered():
	texture = moon

func _on_mouse_exited():
	texture = original_texture
