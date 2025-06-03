class_name StateMachine
extends Node

@export var initial_state: State
@onready var state_label: Label = %StateLabel

var current_state: State
var states: Dictionary[String, State] = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.state_machine = self
			states[child.name.to_lower()] = child
	
	if initial_state:
		current_state = initial_state
		update_state_label(current_state.name)
		initial_state.enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func change_state(new_state_name: String) -> void:
	var new_state: State = states.get(new_state_name.to_lower())
	assert(new_state, "State not found: %s" %new_state_name)
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	update_state_label(current_state.name)
	new_state.enter()

func update_state_label(state_name: String) -> void:
	state_label.text = "State: %s" %state_name.to_pascal_case()
