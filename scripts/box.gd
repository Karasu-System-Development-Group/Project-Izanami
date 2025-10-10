extends Sprite2D
@onready var Area = $Area2D
@onready var hint = $InteractionHint
@onready var furniture = $furniture


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
		if Char.arrangedRooms[0] == "bedroom" and Char.energy == 1:
			TransitionManager.play_transition()
			furniture.play()
			await get_tree().create_timer(2.0).timeout
			Char.livingRoomIsArranged = true
			Char.livingRoomBoxIsVisible = false
			Char.update_livingroom_objects(get_tree().current_scene)
			print("Interagiu com a área")
		elif Char.energy == 0:
			var pensamentos = ["Agora não...", "Estou muito cansada...", "Amanhã eu termino de arrumar...", ""]
			Char.internalDialog(pensamentos)
		else:
			var pensamentos = ["Quando eu terminar de arrumar, vai estar tarde...","Talvez seja melhor arrumar o quarto antes...", "Eu preciso de um lugar para dormir...", ""]
			Char.internalDialog(pensamentos)
