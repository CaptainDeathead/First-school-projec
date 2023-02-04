extends PopupDialog

func _ready():
	$Back.grab_focus()

func _on_Continue_pressed():
	AutoLoad.game_data = {
		"score": 0,
		"level": 0
	}
	AutoLoad.save_data()
	
	self.hide()


func _on_Back_pressed():
	self.hide()
