extends Button

# Variables ----------------------------------------------------------------------------------------

var hover = false

# Functions ----------------------------------------------------------------------------------------

func _on_pressed():
	$"../FileDialog".visible = true

func audio_file_selected(path: String):
	text = path

func _hover_over(area: Area2D):
	hover = true

func _hover_off(area: Area2D):
	hover = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("Accept") and hover == true:
		_on_pressed()
