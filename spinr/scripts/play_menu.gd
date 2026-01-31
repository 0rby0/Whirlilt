extends Node2D

var selected = 0

func _practice_pressed():
	get_tree().change_scene_to_file("res://scenes/practice_mode.tscn")

func _exit_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _normal_pressed():
	get_tree().change_scene_to_file("res://scenes/map_menu.tscn")

func _normal_hovered(_area):
	selected = 1

func _exit_hovered(_area):
	selected = 3

func _practice_hovered(_area):
	selected = 2

func _proccess(_delta):
	match selected:
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
	
	if Input.is_action_pressed("Accept"):
		match selected:
			1: get_tree().change_scene_to_file("res://scenes/practice_mode.tscn")
			3: get_tree().change_scene_to_file("res://scenes/map_menu.tscn")
			2: get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
