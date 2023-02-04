extends Control

func _ready():
	$PlayButton.grab_focus()

func _on_PlayButton_pressed():
	AutoLoad.init()


func _on_Options_pressed():
	get_tree().change_scene("res://Options.tscn")

func _on_Quit_pressed():
	get_tree().quit()
