extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Hover Selection
var selectedButton = 0

# Scenes
var practiceMode = "res://scenes/pm_0_practice_player.tscn"
var mainMenu = "res://scenes/ui_0_main_menu.tscn"
var mapSelector = "res://scenes/ui_0_map_selection.tscn"

# Select Input
var select = "Accept"

# Functions ----------------------------------------------------------------------------------------

func _normal_hovered(_area):
	selectedButton = 3

func _exit_hovered(_area):
	selectedButton = 2

func _practice_hovered(_area):
	selectedButton = 1

func _physics_process(_delta):
	match selectedButton:
		1: 
			$"Practice Button".flat = true
			$"Exit Button".flat = false
			$"Normal Button".flat = false
			
		2:
			$"Practice Button".flat = false
			$"Exit Button".flat = true
			$"Normal Button".flat = false
			
		3:
			$"Practice Button".flat = false
			$"Exit Button".flat = false
			$"Normal Button".flat = true
		
	if Input.is_action_just_pressed(select):
		match selectedButton:
			1: get_tree().change_scene_to_file(practiceMode)
			3: get_tree().change_scene_to_file(mapSelector)
			2: get_tree().change_scene_to_file(mainMenu)
