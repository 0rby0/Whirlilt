extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Hovering Selector
var selectedButton = 0

# Scenes
var gameplay = "res://scenes/ui_0_gamemode_menu.tscn"
var mapMaker = "res://scenes/mm_0_map_maker.tscn"
var settings = "res://scenes/ui_0_settings.tscn"

# Select Button
var select = "Accept"

# File Path
var userPath = OS.get_data_dir()
var mapsPath = userPath + "/SpinR/"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	DirAccess.make_dir_recursive_absolute(mapsPath)

func _play_hover(_area):
	selectedButton = 1

func _create_hover(_area):
	selectedButton = 2

func _exit_hover(_area):
	selectedButton = 3

func _settings_hover(_area):
	selectedButton = 4

func _physics_process(_delta):
	match selectedButton:
		1: 
			$"Play Button".flat = true
			$"Create Button".flat = false
			$"Exit Button".flat = false
			$"Settings Button".flat = false
			
		2:
			$"Play Button".flat = false
			$"Create Button".flat = true
			$"Exit Button".flat = false
			$"Settings Button".flat = false
			
		3:
			$"Play Button".flat = false
			$"Create Button".flat = false
			$"Exit Button".flat = true
			$"Settings Button".flat = false
			
		4:
			$"Play Button".flat = false
			$"Create Button".flat = false
			$"Exit Button".flat = false
			$"Settings Button".flat = true
		
	if Input.is_action_just_pressed(select):
		match selectedButton:
			1: get_tree().change_scene_to_file(gameplay)
			2: get_tree().change_scene_to_file(mapMaker)
			3: get_tree().quit()
			4: get_tree().change_scene_to_file(settings)
