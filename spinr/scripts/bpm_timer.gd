extends Timer

func _ready():
	self.wait_time = 1.0 / (global.BPM / 60.0)
	self.start()

func _on_timeout():
	global.beat += 1
	self.start()
