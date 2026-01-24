extends Button

func _on_pressed():
	if self.text == "+":
		self.text = "-"
	else:
		self.text = "+"
	$Background.visible = !$Background.visible

func create_button_pressed():
	var insertPacket = {"start": int($"Background/Start Input".text), "end": int($"Background/End Input".text), "angle": int($"Background/Angle Input".text)}
	mm_global.map.push_back(insertPacket)
	get_tree().change_scene_to_file("res://scenes/map_maker.tscn")
