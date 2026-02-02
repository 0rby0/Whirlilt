extends Button

# Variables ----------------------------------------------------------------------------------------

# Strings
var plus = "+"
var minus = "-"

# Scenes
var mapMaker = "res://scenes/mm_0_map_maker.tscn"

# Functions ----------------------------------------------------------------------------------------

func _on_pressed():
	if self.text == plus:
		self.text = minus
	else:
		self.text = plus
	$Background.visible = !$Background.visible

func create_button_pressed():
	var insertPacket = {"start": int($"Background/Start Input".text), "end": int($"Background/End Input".text), "angle": int($"Background/Angle Input".text)}
	global.mmMap.push_back(insertPacket)
	get_tree().change_scene_to_file(mapMaker)
