extends Node2D

func _on_tree_entered():
	Char.visible = true
	match Char.lastRoom:
		"bedroom":
			Char.position = $SpawnPointBedroom.position
		"wc":
			Char.position = $SpawnPointWC.position
		"outside":
			Char.position = $SpawnPoint.position
	Char.camera.enabled = true
	Char.camera.limit_right = $house/wall2.global_position.x
	Char.camera.limit_left = $house/wall.global_position.x
