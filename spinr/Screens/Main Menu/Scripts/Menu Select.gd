extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Hovering Selector
var selectedButton = 0

# Scenes
var gameplay = "res://Screens/Gamemode Select/Gamemode Menu.tscn"
var mapMaker = "res://Screens/Map Maker/Map Maker.tscn"
var settings = "res://Screens/Settings/Settings.tscn"

# Select Button
var select = "Accept"

# File Path
var userPath = OS.get_data_dir()
var mapsPath = userPath + "/SpinR/"

# Colours
var yellow = "#bdc200"
var grey = "#808080"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	DirAccess.make_dir_recursive_absolute(mapsPath)
	global.focused = false
	global.mmTitle
	global.mmBPM
	global.mmAudioFile
	global.mmTrackLengthSec
	global.mmMapSelect
	global.editing = false
	global.mmMap = []

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
			$Play.color = yellow
			$Create.color = grey
			$Exit.color = grey
			$Settings.color = grey
		2:
			$Play.color = grey
			$Create.color = yellow
			$Exit.color = grey
			$Settings.color = grey
			
		3:
			$Play.color = grey
			$Create.color = grey
			$Exit.color = yellow
			$Settings.color = grey
			
		4:
			$Play.color = grey
			$Create.color = grey
			$Exit.color = grey
			$Settings.color = yellow
		
	if Input.is_action_just_pressed(select):
		match selectedButton:
			1: get_tree().change_scene_to_file(gameplay)
			2: get_tree().change_scene_to_file(mapMaker)
			3: get_tree().quit()
			4: get_tree().change_scene_to_file(settings)
