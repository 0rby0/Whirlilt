extends Node2D

var distance_to_end
var distance_to_travel
var start_on_beat
var speed_to_travel
var end_on_beat

var previousBeat

@onready var orb_position = $Hitbox.position.x

func _physics_process(_delta):
	if global.mm_beat != previousBeat:
		if start_on_beat <= global.mm_beat and end_on_beat >= global.mm_beat:
			self.visible = true
			distance_to_end = distance_to_travel - (speed_to_travel * (float(global.mm_beat) - start_on_beat))
			$Hitbox.position.x = orb_position + distance_to_end
		else:
			self.visible = false
		previousBeat = global.mm_beat
