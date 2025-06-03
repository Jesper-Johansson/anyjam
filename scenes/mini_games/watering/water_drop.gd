extends Polygon2D



func _process(delta: float) -> void:
	global_position.y += 1 * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("drop"):
		queue_free()
