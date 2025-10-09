extends Sprite2D
@onready var Area = $Area2D
@onready var hint = $InteractionHint
@onready var furniture = $furniture
@onready var fornitune = $"../livingRoomFurniture"
@onready var transition = $"../transition"
@onready var player = $"../char"


var player_in_area = false
var isVisible = false

func playTransition():
	player.set_process_input(false)
	player.set_physics_process(false)
	player.set_process(false)
	transition.visible = true
	transition.modulate.a = 0.0 
	var tween = create_tween()
	tween.tween_property(transition, "modulate:a", 1.0, 1.0)
	await tween.finished
	await get_tree().create_timer(2.5).timeout
	var tween_out = create_tween()
	tween_out.tween_property(transition, "modulate:a", 0.0, 1.0)
	await tween_out.finished
	player.set_process_input(true)
	player.set_physics_process(true)
	player.set_process(true)

	transition.visible = false

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
		playTransition()
		furniture.play()
		fornitune.visible = true
		await get_tree().create_timer(2.0).timeout
		self.visible = false
		print("Interagiu com a área")
