extends Label

# Variables ----------------------------------------------------------------------------------------

# Back Button
var back = "Back"

# Scenes
var mainMenu = "res://scenes/ui_0_main_menu.tscn"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.inputType == "controller":
		self.text = "Press 'B' to exit"
	else:
		self.text = "Press 'Esc' to exit"

func _process(_delta):
	if Input.is_action_just_pressed(back):
		global.score = 0
		global.scoreMult = 1.0
		get_tree().change_scene_to_file(mainMenu)
