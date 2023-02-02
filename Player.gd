extends KinematicBody2D

# makes the variable type int
var score: int = 0

var speed: int = 200
var jumpForce: int = 400
var gravity: int = 800

var vel: Vector2 = Vector2()

onready var sprite: Sprite = get_node("Sprite")

func _physics_process(delta):
	
	vel.x = 0
	
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
	vel = move_and_slide(vel, Vector2.UP)
	
	# gravity
	vel.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("jump"):
		vel.y -= jumpForce
	
	# sprite direction
	if vel.x<0:
		sprite.flip_h = true
	elif vel.x>0:
		sprite.flip_h = false
