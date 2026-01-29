extends Node2D

var orb = preload("res://prefabs/orb.tscn")

@export var orbs : Node2D

var current_orb = 0

func _create_timer_out():
	if global.map[current_orb].start == global.beat:
		$"..".rotation = global.map[current_orb].angle
		var orb_instance = orb.instantiate()
		orb_instance.distance_to_end = 216.0
		orb_instance.distance_to_travel = orb_instance.distance_to_end
		orb_instance.start_on_beat = global.map[current_orb].start
		orb_instance.end_on_beat = global.map[current_orb].end
		orb_instance.speed_to_travel = orb_instance.distance_to_travel / (orb_instance.end_on_beat - orb_instance.start_on_beat)
		orb_instance.look_at($"..".position)
		self.add_child(orb_instance)
		orb_instance.reparent(orbs)
		if current_orb + 1 < global.map.size():
			current_orb += 1
