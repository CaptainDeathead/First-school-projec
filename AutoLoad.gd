extends Node

var score: int = 0
var level : int = 1

const SAVE_FILE = "user://save_file.save"
var game_data = {}

func init():
	load_data()
	if game_data.level == 2:
		get_tree().change_scene("res://Level2.tscn")
	elif game_data.level == 3:
		get_tree().change_scene("res://Level3.tscn")
	elif game_data.level == 4:
		get_tree().change_scene("res://Level4.tscn")
	else:
		get_tree().change_scene("res://MainScene.tscn")
		
	# score loading
	level = game_data.level
	score = game_data.score

func save_data():
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()
	
func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		game_data = {
			"score": 0,
			"level": 1
		}
		save_data()
	file.open(SAVE_FILE, File.READ)
	game_data = file.get_var()
	file.close()
