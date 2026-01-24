extends Sprite2D

var add = preload("res://assets/MM_Map_Add_Marker.png")
var del = preload("res://assets/MM_Map_Delete_Marker.png")

# 0: Add
# 1: Delete
@export var markerType: int
var beatRef : int

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
	mm_global.map.remove_at(beatRef)
	get_tree().change_scene_to_file("res://scenes/map_maker.tscn")
	global.focused = false

func _on_no_pressed():
	$"Delete Background".visible = false
	global.focused = false
