extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var footsteps = $footsteps
@export var speed = 400
@onready var camera = $Camera2D

@onready var bedRoomFurniture = $bedRoomFurnitrune
@onready var bedRoomBox = $bedroomBox

var bedRoomIsArranged = false
var bedRoomBoxIsVisible = true


@onready var livingRoomFurniture = $livingRoomFurniture
@onready var livingRoomBox = $livingRoomBox

var livingRoomIsArranged = false
var livingRoomBoxIsVisible = true


var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()
var lastRoom = "outside"
var energy = 1
var arrangedRooms = [""]



func update_bedroom_objects(scene):
	var furn = scene.get_node_or_null("bedRoomFurnitrune")
	var box = scene.get_node_or_null("bedroomBox")
	if furn: furn.visible = bedRoomIsArranged
	if box: box.visible = bedRoomBoxIsVisible




func update_livingroom_objects(scene):
	var furn = scene.get_node_or_null("livingRoomFurniture")
	var box = scene.get_node_or_null("livingRoomBox")
	if furn: furn.visible = livingRoomIsArranged
	if box: box.visible = livingRoomBoxIsVisible



func canMove(canMove):
	self.anim.play("idle")
	self.set_process_input(canMove)
	self.set_physics_process(canMove)
	self.set_process(canMove)


func updatePensamento(texto):
	$RichTextLabel.text = texto
	
	

func internalDialog(pensamentos):
		self.canMove(false)
		var i = 0
		for pensamento in pensamentos:
			Char.updatePensamento(pensamento)
			if i == pensamentos.size() - 1 :
				await get_tree().create_timer(1.0).timeout
			else:
				await get_tree().create_timer(3.0).timeout
				i+=1
		self.canMove(true)


func moveToOtherPlace(openDoor, lastRoom: String, nextPlace: String):
	self.canMove(false)
	TransitionManager.play_transition()
	openDoor.play()
	await get_tree().create_timer(2.0).timeout
	Char.lastRoom = lastRoom
	get_tree().change_scene_to_file(nextPlace)
	self.canMove(true)




func _ready():
	anim.play("idle")
	camera.enabled = false
	camera.limit_left = 10
	camera.limit_right = 10
	if bedRoomFurniture:
		bedRoomFurniture.visible = true
	if bedRoomBox:
		bedRoomBox.visible = false


func _physics_process(delta):
	direction = Vector2.ZERO

	if Input.is_action_pressed("walkRight"):
		direction.x += 1
		anim.flip_h = true
		anim.play("walk")
		if not footsteps.playing:
			footsteps.play()
	elif Input.is_action_pressed("walkLeft"):
		direction.x -= 1
		anim.flip_h = false
		anim.play("walk")
		if not footsteps.playing:
			footsteps.play()
	else:
		anim.play("idle")
		footsteps.stop()


	velocity = direction * speed
	move_and_slide()
