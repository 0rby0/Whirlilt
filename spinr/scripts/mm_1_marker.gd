extends Sprite2D

# Variables ----------------------------------------------------------------------------------------

# Preload Assets
var add = preload("res://assets/mm_2_add_marker.png")
var del = preload("res://assets/mm_2_delete_marker.png")

# 0: Add
# 1: Delete
@export var markerType: int
# Where to Remove the Beat in the Event of Deletion
var beatRef : int

# Scenes
var mapMaker = "res://scenes/mm_0_map_maker.tscn"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	match markerType:
		0:
			self.texture = add
		1:
			self.texture = del

func _physics_process(_delta):
	$Clickbox.disabled = global.focused

func _on_clickbox_pressed():
	$"Delete Background".visible = true
	global.focused = true

func _on_yes_pressed():
	global.mmMap.remove_at(beatRef)
	get_tree().change_scene_to_file(mapMaker)
	global.focused = false

func _on_no_pressed():
	$"Delete Background".visible = false
	global.focused = false
