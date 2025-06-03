class_name Player
extends CharacterBody2D


var input_direction: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	move_and_slide()

func move(speed:float, acceleration:float, delta:float) -> void:
	velocity = lerp(velocity, input_direction * speed, delta * acceleration)
