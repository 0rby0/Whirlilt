extends Node2D

var distance_to_end

var distance_to_travel

var start_on_beat
var end_on_beat

var speed_to_travel

@onready var orb_position = $Hitbox.position.x

func _physics_process(_delta):
	distance_to_end = distance_to_travel - (speed_to_travel * (float(global.beat) - start_on_beat))
	
	var tween = create_tween()
	tween.set_parallel()
	tween.set_ease(Tween.EASE_OUT_IN)
	tween.tween_property($Hitbox, "position", Vector2(orb_position + distance_to_end, 0), global.moveTime + 3)
