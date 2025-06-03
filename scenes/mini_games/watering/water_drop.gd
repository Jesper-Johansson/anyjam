class_name WaterDrop
extends Polygon2D


var sep: bool = false


func _process(delta: float) -> void:
	spread_water(delta, sep)




func spread_water(delta: float, sep_bool: bool) -> void:
	if sep_bool:
		global_position.y += 100 * delta
		global_position.x += randf_range(-1, 1)
	else:
		global_position.y += 100 * delta
		global_position.x += randf_range(-0.3, 0.3)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("count"):
		queue_free()
