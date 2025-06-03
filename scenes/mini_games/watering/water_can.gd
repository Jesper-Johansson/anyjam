extends Polygon2D


@export var water_drop: PackedScene
@onready var drop_point: Marker2D = %DropPoint
@onready var drops: Node2D = %Drops

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
	
	if rotation_degrees < -30:
		var drop: WaterDrop = water_drop.instantiate()
		drop.global_position = drop_point.global_position
		drops.add_child(drop)
		if rotation_degrees < -60:
			drop.over.emit()


func handle_rotate(delta: float, rotating: bool) -> void:
	if rotating:
		rotation_degrees = lerp(rotation_degrees, max_rotation, 1 * delta)
	else:
		rotation_degrees = lerp(rotation_degrees, 0.0, 10 * delta)
