extends Button

func _physics_process(_delta):
	if Input.is_action_pressed("Back"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_pressed_MMM():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_pressed_set():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
