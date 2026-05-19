extends MeshInstance2D

# Variables ----------------------------------------------------------------------------------------

const speed = 10

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.inputType == "controller":
		self.position.x = get_viewport().size.x / 2
		self.position.y = get_viewport().size.y / 2
		self.visible = true
	else:
		self.visible = false

func _physics_process(_delta):
	var inputDir: Vector2 = Input.get_vector("axis_left", "axis_right", "axis_up", "axis_down")
	self.global_position += inputDir * speed
