extends Label

# Variables ----------------------------------------------------------------------------------------

# Back Button
var back = "Back"

# Scenes
var mainMenu = "res://scenes/ui_0_main_menu.tscn"

# Functions ----------------------------------------------------------------------------------------

func _process(_delta):
	if Input.is_action_just_pressed(back):
		get_tree().change_scene_to_file(mainMenu)
