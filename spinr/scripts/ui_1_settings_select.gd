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

var mouseHovered = false
var controllerHovered = false

# Functions ----------------------------------------------------------------------------------------

# Load Setup
func _ready():
	var inputSettings = ConfigFileHandler.load_input_settings()
	global.inputType = inputSettings.inputMethod
	
	if global.inputType == typeMouse:
		$"Settings Buttons/Mouse".color = yellow
		$"Settings Buttons/Controller".color = grey
	elif global.inputType == typeControl:
		$"Settings Buttons/Controller".color = yellow
		$"Settings Buttons/Mouse".color = grey

# Main Function
func _set_mouse():
	global.inputType = typeMouse
	ConfigFileHandler.save_input_setting("inputMethod", "mouse")
	get_tree().change_scene_to_file(settings)

func _set_controller():
	global.inputType = typeControl
	ConfigFileHandler.save_input_setting("inputMethod", "controller")
	get_tree().change_scene_to_file(settings)

# Cursor Function

func _physics_process(_delta):
	if Input.is_action_just_pressed("Accept"):
		if mouseHovered == true:
			_set_mouse()
		if controllerHovered == true:
			_set_controller()

func _mouse_hover_over(area: Area2D):
	if area.is_in_group("cursor"):
		mouseHovered = true

func _mouse_hover_off(area: Area2D):
	if area.is_in_group("cursor"):
		mouseHovered = false

func _controller_hover_over(area: Area2D):
	if area.is_in_group("cursor"):
		controllerHovered = true

func _controller_hover_off(area: Area2D):
	if area.is_in_group("cursor"):
		controllerHovered = false
