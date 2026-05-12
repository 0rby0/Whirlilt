extends Label

func _physics_process(_delta):
	$".".text = str(global.scoreMult) + "x"
	$"../Score".text = str(global.score)
