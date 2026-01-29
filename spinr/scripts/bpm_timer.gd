extends Timer

func _on_timeout():
	if global.beat == 3:
		$"../Music Player".play()
	
	global.beat += 1
	self.start()
