class_name IdleState
extends State

@export var player: Player

@export var friction: float = 20.0


func physics_update(delta: float) -> void:
	if player.input_direction != Vector2.ZERO:
		state_machine.change_state("walk")
	
	player.move(0, friction, delta)
