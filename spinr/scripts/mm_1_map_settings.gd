extends Control

# Variables ----------------------------------------------------------------------------------------

# Scenes
var mapMaker = "res://scenes/mm_0_map_maker.tscn"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.editing == true:
		$"Detail Edit".visible = false
		$Editor.visible = true
	else:
		if global.mmTitle != null:
			$"Detail Edit/Menu Background/Title Text/Title Input".text = global.mmTitle
			$"Detail Edit/Menu Background/BPM Text/BPM Display".text = str(global.mmBPM)
			$"Detail Edit/Menu Background/Music File Text/Select Button".text = global.mmMapSelect
		$"Detail Edit".visible = true
		$Editor.visible = false

func _on_save_pressed():
	global.mmTitle = $"Detail Edit/Menu Background/Title Text/Title Input".text
	global.mmBPM = int($"Detail Edit/Menu Background/BPM Text/BPM Display".text)
	global.mmMoveTime = 1.0 / (float(global.mmBPM) / 60.0)

	var file = FileAccess.open($"Detail Edit/Menu Background/Music File Text/Select Button".text, FileAccess.READ)
	global.mmMapSelect = $"Detail Edit/Menu Background/Music File Text/Select Button".text
	var data = file.get_buffer(file.get_length())
	file.close()
	global.mmAudioFile = AudioStreamMP3.load_from_buffer(data)
	$"Editor/Audio File Player".stream = global.mmAudioFile
	global.mmTrackLengthSec = $"Editor/Audio File Player".stream.get_length()
	
	var tickNum = float(float(global.mmBPM) / 60) * float(global.mmTrackLengthSec)
	global.tickCount = tickNum
	$"Editor/Hide While Playing/Timeline".max_value = int(tickNum)
	$"Editor/Hide While Playing/Timeline".tick_count = int(tickNum)
	
	global.editing = true
	
	get_tree().change_scene_to_file(mapMaker)

func _open_menu():
	global.editing = false
	get_tree().change_scene_to_file(mapMaker)
