extends Button

@onready var timeline = $"../Hide While Playing/Timeline"

func _on_pressed():
	$"../Audio File Player".play()

func _physics_process(_delta):
	while mm_global.playing:
		var beat = (mm_global.BPM / 60) * $"../Audio File Player".get_playback_position() 
		timeline.value = beat
