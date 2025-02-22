@icon('uid://cxwl1u3hcm7vv')
class_name CharacterController extends Node

signal key_pressed(event: InputEvent)
signal key_released(event: InputEvent)

func _input(event: InputEvent) -> void:
	if event.is_pressed():
		key_pressed.emit(event)
	if event.is_released():
		key_released.emit(event)
