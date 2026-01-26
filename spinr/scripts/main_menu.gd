extends Node2D

var selected = 0

# Buttons
func _play_pressed():
	get_tree().change_scene_to_file("res://scenes/map_menu.tscn")

func _create_pressed():
	get_tree().change_scene_to_file("res://scenes/map_maker.tscn")

func _exit_pressed():
	get_tree().quit()

func _settings_pressed():
	pass

# Hovers
func _play_hover(_area):
	selected = 1

func _create_hover(_area):
	selected = 2

func _exit_hover(_area):
	selected = 3

func _settings_hover(_area):
	selected = 4

func _physics_process(_delta):
	match selected:
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
	
	if Input.is_action_pressed("Accept"):
		match selected:
			1: get_tree().change_scene_to_file("res://scenes/map_menu.tscn")
			2: get_tree().change_scene_to_file("res://scenes/map_maker.tscn")
			3: get_tree().quit()
			4: pass
