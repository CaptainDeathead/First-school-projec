extends KinematicBody2D

# makes the variable type int
var LevelCollected : int = 0

var speed: int = 200
var jumpForce: int = 400
var gravity: int = 800

var vel: Vector2 = Vector2()

onready var sprite: Sprite = get_node("Sprite")
# imports the ui script
onready var ui: Node = get_node("/root/MainScene/CanvasLayer/UI")

onready var audioPlayer : Node = get_node("/root/MainScene/Camera2D/AudioPlayer")

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
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	# sprite direction
	if vel.x<0:
		sprite.flip_h = true
	elif vel.x>0:
		sprite.flip_h = false

func die():
	AutoLoad.score -= LevelCollected
	LevelCollected = 0
	get_tree().reload_current_scene()

func collect_coin(value):
	AutoLoad.score += value
	LevelCollected += value
	ui.set_score_text(AutoLoad.score)
	audioPlayer.play_coin_sfx()
