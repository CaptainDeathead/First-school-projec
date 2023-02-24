extends Area2D

onready var player = get_node("/root/Scene6/Player")
var run : bool = false

func _process(delta):
	if run:
		# make the missile move towards the player
		var direction = player.position - position
		direction = direction.normalized()
		position += direction * 200 * delta
		# if the missile is out of the screen, destroy it
		if position.x > 800 or position.x < 0 or position.y > 600 or position.y < 0:
			queue_free()


func _on_Missile_body_entered(body):
	if body.name == "Player":
		# if the missile hits the player, destroy the player
		body.die()
		queue_free()
