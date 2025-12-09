extends Marker2D

func _process(_delta):
	match (global.input_type):
		"controller":
			var joystick_pos = Input.get_vector("axis_left", "axis_right", "axis_up", "axis_down")
			look_at(joystick_pos)
		"mouse":
			look_at(get_global_mouse_position())
