extends Marker2D

var orb = preload("res://prefabs/mm_orb.tscn")

@export var orbs : Node2D

func _ready():
	$"..".position.x = get_viewport().size.x / 2
	$"..".position.y = get_viewport().size.y / 2
	
	if orbs != null:
		for i in range(mm_global.map.size()):
			$"..".rotation = mm_global.map[i].angle
			var orb_instance = orb.instantiate()
			orb_instance.distance_to_end = 200.0
			orb_instance.distance_to_travel = orb_instance.distance_to_end
			orb_instance.start_on_beat = mm_global.map[i].start
			orb_instance.end_on_beat = mm_global.map[i].end
			orb_instance.speed_to_travel = orb_instance.distance_to_travel / (orb_instance.end_on_beat - orb_instance.start_on_beat)
			orb_instance.look_at(self.position)
			self.add_child(orb_instance)
			orb_instance.reparent(orbs)
