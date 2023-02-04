extends Area2D

onready var save_file = AutoLoad.game_data
onready var ui: Node = get_node("/root/MainScene/CanvasLayer/UI")

func _on_Portal_body_entered(body):
	if body.name == "Player":
		AutoLoad.level = 2
		save_file.level = AutoLoad.level
		save_file.score = AutoLoad.score
		AutoLoad.save_data()
		ui.set_level_text()
		get_tree().change_scene("res://Level2.tscn")
