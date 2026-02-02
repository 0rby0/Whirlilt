extends Button

# Variables ----------------------------------------------------------------------------------------

# Gameplay Scene
var gameplaySceneString = "res://scenes/gp_0_map_player.tscn"

# Functions ----------------------------------------------------------------------------------------
func _on_pressed():
	global.mapTitle = self.text
	get_tree().change_scene_to_file(gameplaySceneString)
