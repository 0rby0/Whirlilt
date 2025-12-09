extends Node2D

var orb = preload("res://prefabs/orb.tscn")

var rng = RandomNumberGenerator.new()

func _create_timer_out():
	$"..".rotation = rng.randi_range(-180, 180)
	var orb_instance = orb.instantiate()
	orb_instance.distance_to_end = 10.0
	orb_instance.distance_to_travel = orb_instance.distance_to_end
	orb_instance.start_on_beat = float(global.beat)
	orb_instance.end_on_beat = float(global.beat) + 10.0
	orb_instance.speed_to_travel = orb_instance.distance_to_travel / (orb_instance.end_on_beat - orb_instance.start_on_beat)
	orb_instance.look_at($"..".position)
	self.add_child(orb_instance)
