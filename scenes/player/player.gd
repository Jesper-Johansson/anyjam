class_name Player
extends CharacterBody2D


@export var max_speed: float = 200
@export var acceleration: float = 10.0
@export var friction: float = 20.0


func _physics_process(delta: float) -> void:
	handle_movement(delta)
	move_and_slide()


func handle_movement(delta: float) -> void:
	var input = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	var lerp_weight = delta * (acceleration if input else friction)
	velocity = lerp(velocity, input * max_speed, lerp_weight)
