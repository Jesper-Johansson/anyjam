extends Polygon2D

var max_rotation: float = -65
var spiting: bool = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	if not spiting:
		if event is InputEventMouseMotion:
			global_position = event.global_position


func _process(delta: float) -> void:
	if Input.is_action_pressed("left_click"):
		spiting = true
		handle_rotate(delta, spiting)
	else:
		spiting = false
		handle_rotate(delta, spiting)


func handle_rotate(delta: float, rotating: bool) -> void:
	if rotating:
		rotation_degrees = lerp(rotation_degrees, max_rotation, 1 * delta)
	else:
		rotation_degrees = lerp(rotation_degrees, 0.0, 10 * delta)
