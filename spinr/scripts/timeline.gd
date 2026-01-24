extends HSlider

var currentBeat
var mapLengthBeats

func current_beat_changed(sliderValue: float):
	currentBeat = int(sliderValue)
	mapLengthBeats = int(self.max_value)
	$"Current Beat".text = str(currentBeat) + " / " + str(mapLengthBeats)
	global.mm_beat  = currentBeat
