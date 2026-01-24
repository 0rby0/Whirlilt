extends Control

var title
var BPM
var audioFile
var trackLengthSec

var playing = false

var map = [{"start": 1, "end": 8, "angle": 90}, {"start": 2, "end": 10, "angle": 180}, {"start": 5, "end": 9, "angle": 30}]

func _on_save_pressed():
	title = $"Detail Edit/Menu Background/Title Text/Title Input".text
	BPM = $"Detail Edit/Menu Background/BPM Text/BPM Display".text
	
	var file = FileAccess.open($"Detail Edit/Menu Background/Music File Text/Select Button".text, FileAccess.READ)
	var data = file.get_buffer(file.get_length())
	file.close()
	audioFile = AudioStreamMP3.load_from_buffer(data)
	$"Editor/Audio File Player".stream = audioFile
	trackLengthSec = $"Editor/Audio File Player".stream.get_length()
	
	var tickNum = float(float(BPM) / 60) * float(trackLengthSec)
	$"Editor/Hide While Playing/Timeline".max_value = int(tickNum)
	$"Editor/Hide While Playing/Timeline".tick_count = int(tickNum)
	
	$"Detail Edit".visible = false
	$Editor.visible = true
