extends Control
@onready var keyboard: Sprite2D = %Keyboard
@onready var gamepad: Sprite2D = %Gamepad

func _ready() -> void:
	keyboard.visible = false
	gamepad.visible = false
	InputHelper.device_changed.connect(_on_device_changed)
	_on_device_changed(null, InputHelper.device_index)

func _on_device_changed(_devide, index):
	if index == -1:
		keyboard.visible = true
		gamepad.visible = false
	else:
		keyboard.visible = false
		gamepad.visible = true
