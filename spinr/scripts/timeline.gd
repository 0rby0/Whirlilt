extends HSlider

var currentBeat
var mapLengthBeats

func _ready():
	self.max_value = global.tickCount

func current_beat_changed(sliderValue: float):
	currentBeat = int(sliderValue)
	mapLengthBeats = int(self.max_value)
	$"Current Beat".text = str(currentBeat) + " / " + str(mapLengthBeats)
	global.mm_beat  = currentBeat
