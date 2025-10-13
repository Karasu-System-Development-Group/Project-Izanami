extends Node2D

func _on_tree_entered():
	Char.visible = true
	Char.position = $SpawnPoint.position
	Char.camera.enabled = true
	Char.camera.limit_right = $house/wall2/CollisionShape2D.global_position.x
	Char.camera.limit_left = $house/wall/CollisionShape2D.global_position.x

func _ready():
	if Char.bedRoomBoxIsVisible:
		$bedroomBox.visible = true
		$bedRoomFurnitrune.visible = false
	else:
		$bedRoomFurnitrune.visible = true
		$bedroomBox.visible = false
