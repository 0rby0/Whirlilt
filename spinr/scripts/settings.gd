extends Control

func _ready():
	if global.input_type == "mouse":
		$CanvasLayer/Mouse.color = "#bdc200"
		$CanvasLayer/Controller.color = "#808080"
	elif global.input_type == "controller":
		$CanvasLayer/Controller.color = "#bdc200"
		$CanvasLayer/Mouse.color = "#808080"

func _set_mouse():
	global.input_type = "mouse"
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _set_controller():
	global.input_type = "controller"
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
