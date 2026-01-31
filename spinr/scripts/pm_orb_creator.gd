extends Node2D

var orb = preload("res://prefabs/orb.tscn")

@export var orbs : Node2D

var rng = RandomNumberGenerator.new()

func _create_timer_out():
	if rng.randi_range(0,1) == 1 :
		$"..".rotation = rng.randf_range(0, 360)
		var orb_instance = orb.instantiate()
		orb_instance.distance_to_end = 216.0
		orb_instance.distance_to_travel = orb_instance.distance_to_end
		orb_instance.start_on_beat = global.beat
		orb_instance.end_on_beat = global.beat + rng.randi_range(1, 5)
		orb_instance.speed_to_travel = orb_instance.distance_to_travel / (orb_instance.end_on_beat - orb_instance.start_on_beat)
		orb_instance.look_at($"..".position)
		self.add_child(orb_instance)
		orb_instance.reparent(orbs)
