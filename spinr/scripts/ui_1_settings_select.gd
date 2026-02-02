extends Control

# Variables ----------------------------------------------------------------------------------------

# Input Types
var typeMouse = "mouse"
var typeControl = "controller"

# Colours
var yellow = "#bdc200"
var grey = "#808080"

# Scenes
var settings = "res://scenes/ui_0_settings.tscn"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.inputType == typeMouse:
		$CanvasLayer/Mouse.color = yellow
		$CanvasLayer/Controller.color = grey
	elif global.inputType == typeControl:
		$CanvasLayer/Controller.color = yellow
		$CanvasLayer/Mouse.color = grey

func _set_mouse():
	global.inputType = typeMouse
	get_tree().change_scene_to_file(settings)

func _set_controller():
	global.inputType = typeControl
	get_tree().change_scene_to_file(settings)
