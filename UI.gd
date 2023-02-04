extends Control
	
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
