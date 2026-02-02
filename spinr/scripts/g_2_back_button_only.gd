extends Button

# Variables ----------------------------------------------------------------------------------------

# Scenes
var mainMenu = "res://scenes/ui_0_main_menu.tscn"

# Back Button
var back = "Back"

# Functions ----------------------------------------------------------------------------------------

func _physics_process(_delta):
	if Input.is_action_pressed(back):
		get_tree().change_scene_to_file(mainMenu)

func _on_pressed():
	get_tree().change_scene_to_file(mainMenu)

func _on_pressed_MMM():
	get_tree().change_scene_to_file(mainMenu)

func _on_pressed_set():
	get_tree().change_scene_to_file(mainMenu)
