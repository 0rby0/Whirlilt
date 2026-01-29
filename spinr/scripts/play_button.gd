extends Button

@onready var timeline = $"../Hide While Playing/Timeline"
@onready var audioPlayer = $"../Audio File Player"
@onready var timer = $"../Beat Timer"

func _on_pressed():
	$"../Hide While Playing".visible = false
	timer.wait_time = 1.0 / (float(global.mmBPM) / 60.0)
	timer.start()
	audioPlayer.play()

func beat_timer_out():
	global.mm_beat += 1
	timer.start()

func _audio_out():
	timer.stop()
	$"../Hide While Playing".visible = true
