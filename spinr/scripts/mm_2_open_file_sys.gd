extends Button

func _on_pressed():
	$"../FileDialog".visible = true

func audio_file_selected(path: String):
	text = path
