class_name DialogueManager extends Node

@onready var text_box: RichTextLabel = $DialogueBox/DialogueText
@onready var portrait_box: TextureRect = $DialogueBox/DialoguePortrait

## The delay in seconds for each character to be written out, to make the text "animated."
@export var text_speed: float = 0.05
@export var test_dialogue: DialogueEvent

var _active_event: DialogueEvent = null
var _index: int = 0
var _tween: Tween = null
func _ready():
	self.visible = false
	#play_dialogue(test_dialogue)

func _input(event):
	if Input.is_action_just_pressed("dialogue_next"):
		_next_speech()

## Initiates a new dialogue, showing the dialogue window until the player has gone through each part.
func play_dialogue(event: DialogueEvent) -> void:
	_active_event = event
	_index = 0
	self.visible = true

	_next_speech()

func _next_speech() -> void:
	if _active_event:
		if _tween:
			_reset_tween()
			text_box.visible_ratio = 1.0
			return
		elif _index <= _active_event.speeches.size() - 1:
			var speech_text: String = _active_event.speeches[_index].text
			text_box.text = speech_text
			text_box.visible_ratio = 0	# Make the text hidden initially

			# Use a tween to gradually type out the text
			_tween = get_tree().create_tween()
			var text_duration = text_speed * _active_event.speeches[_index].text_speed_modifier * speech_text.length()
			_tween.tween_property(text_box, "visible_ratio", 1, text_duration)

			_index += 1
		else:
			_end_dialogue()


func _end_dialogue() -> void:
	_reset_tween()
	_active_event = null
	_index = 0
	self.visible = false

func _reset_tween() -> void:
	if _tween:
		_tween.kill()
		_tween = null
