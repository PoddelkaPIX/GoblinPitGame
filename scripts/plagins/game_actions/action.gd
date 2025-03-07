class_name Action extends Node

signal entered
signal exited
signal physics_updated(delta: float)
signal updated(delta: float)

@export_category('Flags')
@export var _is_disabled: bool = false:
	set(value):
		_is_disabled = value
		_execute() if value == true else _stop()

func _physics_process(_delta: float) -> void:
	if _is_disabled: return
	
	_physics_update()

func _physics_update():
	pass
	
func _execute():
	pass
	
func _stop():
	pass
