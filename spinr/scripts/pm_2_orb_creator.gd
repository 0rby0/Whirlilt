extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Orb Prefab
var orb = preload("res://prefabs/g_t_orb.tscn")

# Orb Parent Node
@export var orbs : Node2D

# RNG Module
var rng = RandomNumberGenerator.new()

# Orb Spawn Chance
# RNG Minimum Value
var rngMin = 0
# RNG Maximum Value
var rngMax = 1
# Required Value
var reqVal = 1

# RNG Angle
# Angle Minimum Value
var angMin = 0
# Angle Maximum Value
var angMax = 360

# RNG End Beat Values
# Minimum End Value
var minEnd = 1
# Maximum End Value
var maxEnd = 5

# Distance To Centre
var dist = 216.0

# Functions ----------------------------------------------------------------------------------------

func _create_timer_out():
	if rng.randi_range(rngMin,rngMax) == reqVal :
		$"..".rotation = rng.randf_range(angMin, angMax)
		var orbInstance = orb.instantiate()
		orbInstance.distanceToEnd = dist
		orbInstance.distanceToTravel = orbInstance.distanceToEnd
		orbInstance.startOnBeat = global.beat
		orbInstance.endOnBeat = global.beat + rng.randi_range(minEnd, maxEnd)
		orbInstance.speedToTravel = orbInstance.distanceToTravel / (orbInstance.endOnBeat - orbInstance.startOnBeat)
		orbInstance.look_at($"..".position)
		self.add_child(orbInstance)
		orbInstance.reparent(orbs)
