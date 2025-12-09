extends Node2D

var distance_to_end

var distance_to_travel

var start_on_beat
var end_on_beat

var speed_to_travel

func _physics_process(_delta):
	distance_to_end = distance_to_travel - (speed_to_travel * (float(global.beat) - start_on_beat))
	var orb_position = $Hitbox.position.x
	$Hitbox.position.x = orb_position - distance_to_end
