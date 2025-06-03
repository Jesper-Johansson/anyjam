extends Polygon2D


@onready var static_body_2d: Area2D = %Area
@onready var label: Label = %Label

var drop_count: int = 0

func _ready() -> void:
	_update_label()

func _on_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("drop"):
		drop_count += 1
		_update_label()


func _update_label() -> void:
	label.text = "Count: %s" %drop_count
