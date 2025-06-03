class_name WalkState
extends State


@export var player: Player

@export var acceleration: float = 10.0
@export var max_speed: float = 100.0



func physics_update(delta: float) -> void:
	if player.input_direction == Vector2.ZERO:
		state_machine.change_state("idle")
	
	player.move(max_speed, acceleration, delta)
