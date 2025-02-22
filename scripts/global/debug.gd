extends Node

@onready var CONTROLLER_INDICATOR = preload("res://scenes/_debug/current_controller_indicator.tscn").instantiate()
@onready var CHARACTERS_DATA_DISPLAY = preload("res://scenes/_debug/characters_data_display.tscn").instantiate()

var _is_debuging = false:
	set(value):
		_is_debuging = value
		for childe in get_children():
			childe.visible = value
			

func _ready() -> void:
	add_child(CONTROLLER_INDICATOR)
	add_child(CHARACTERS_DATA_DISPLAY)
	_is_debuging = _is_debuging

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('debug'):
		_is_debuging = !_is_debuging
