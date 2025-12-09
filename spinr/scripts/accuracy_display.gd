extends Label

func _process(_delta):
	if global.hit_orbs + global.missed_orbs == 0:
		$".".text = "100%"
	else:
		var accuracy = int(global.hit_orbs / (global.hit_orbs + global.missed_orbs) * 100)
		$".".text = str(accuracy) + "%"
