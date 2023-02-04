extends Control

func _ready():
	$ClearGameData.grab_focus()

func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_ClearGameData_pressed():
	$PopupDialog.show()
	$PopupDialog.grab_focus()
