extends Sprite2D
@onready var Area = $Area2D
@onready var hint = $InteractionHint
@onready var openDoor = $openDoor

var player_in_area = false
var isVisible = false


func _on_area_2d_body_entered(body):
	player_in_area = true
	isVisible = true
	hint.visible = isVisible
	print("Jogador entrou na área")

func _on_area_2d_body_exited(body):
	player_in_area = false
	isVisible = false
	hint.visible = isVisible
	print("Jogador saiu da área")

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		openDoor.play()
		print("Interagiu com a área")
