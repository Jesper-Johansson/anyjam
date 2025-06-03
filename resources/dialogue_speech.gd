class_name DialogueSpeech extends Resource

@export var portrait: CompressedTexture2D
@export var text: String
## A multiplier for the speed the text will be written out. For example, a common technique in Undertale is slowing down certain lines for dramatic emphasis.
@export var text_speed_modifier: float = 1.0