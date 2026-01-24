extends Control

@onready var screenWidth = get_viewport().size.x
@onready var chunkCount = $"..".max_value#mm_global.tickNum

@onready var chunkWidth = screenWidth / chunkCount

var marker = preload("res://prefabs/map_maker_markers.tscn")

func _ready():
	for i in range(mm_global.map.size()):
		var marker_instance = marker.instantiate()
		marker_instance.markerType = 0
		marker_instance.scale.x = 0.075
		marker_instance.scale.y = 0.075
		marker_instance.beatRef = i
		marker_instance.position.x = chunkWidth * mm_global.map[i].start - 1
		self.add_child(marker_instance)
		
	for i in range(mm_global.map.size()):
		var marker_instance = marker.instantiate()
		marker_instance.markerType = 1
		marker_instance.scale.x = 0.075
		marker_instance.scale.y = 0.075
		marker_instance.beatRef = i
		marker_instance.position.x = chunkWidth * mm_global.map[i].end
		self.add_child(marker_instance)
