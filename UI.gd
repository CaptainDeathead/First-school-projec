extends Control

onready var player: Node = get_node("/root/MainScene/Player")
	
func _ready():
	$ScoreText.text = str(AutoLoad.score)
	if str(AutoLoad.level) == "0":
		$LevelText.text = "Level: 1"
	else:
		$LevelText.text = "Level: " + str(AutoLoad.level)
	get_node("ScoreText").add_color_override("font_color", Color(1,1,0,1))
	get_node("LevelText").add_color_override("font_color", Color(1,0,0,1))
	
func set_score_text(score):
	$ScoreText.text = str(score)

func set_level_text():
	if str(AutoLoad.level) == "0":
		$LevelText.text = "Level: 1"
	else:
		$LevelText.text = "Level: " + str(AutoLoad.level)


func _on_ContinueButton_pressed():
	player.is_paused = false
	$PauseMenu.hide()


func _on_ExitMenuButton_pressed():
	OS.window_fullscreen = false
	get_tree().change_scene("res://MainMenu.tscn")


func _on_ExitHomeButton_pressed():
	get_tree().quit()
