extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startX : int = position.x
onready var targetX : int = position.x + moveDist
var rotationSpeed : float = 90.0

func _ready():
	pass
	
func _process(delta):
	
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
			rotationSpeed = 90
		else:
			targetX = startX
			rotationSpeed = -90
	rotation_degrees += rotationSpeed * delta

func move_to(current, to, step):
	var new = current
	if new < to:
		new += step
		if new > to:
			new = to
	else:
		new -= step
		if new < to:
			new = to
	return new


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()


func _on_Enemy2_body_entered(body):
	pass # Replace with function body.
