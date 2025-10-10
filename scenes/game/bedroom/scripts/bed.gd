extends Sprite2D

@onready var Area = $bedArea2D
@onready var hint = $bedArea2D/sleepHint
@onready var furniture = $furniture



var player_in_area = false
var isVisible = false


func _on_bed_area_2d_body_entered(body):
	player_in_area = true
	if Char.energy == 0 and self.visible:
		isVisible = true
		hint.visible = isVisible
	print("Jogador entrou na área")

func _on_bed_area_2d_body_exited(body):
	player_in_area = false
	isVisible = false
	hint.visible = isVisible
	print("Jogador saiu da área")
	

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact") and self.visible and Char.energy == 0:
		TransitionManager.play_transition()
		await get_tree().create_timer(2.0).timeout
		Char.energy = 1
		print("Interagiu com a área")
