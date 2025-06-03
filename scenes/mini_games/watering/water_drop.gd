class_name WaterDrop
extends Polygon2D
signal over
var sep: bool = false

func _ready() -> void:
	over.connect(begin_separate)

func _process(delta: float) -> void:
	global_position.y += 100 * delta
	if sep:
		global_position.x += randf_range(-1, 1)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("drop"):
		queue_free()


func begin_separate() -> void:
	sep = true
