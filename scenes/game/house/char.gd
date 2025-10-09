extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var footsteps = $footsteps
@export var speed = 400
var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()

func _ready():
	anim.play("idle")

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
