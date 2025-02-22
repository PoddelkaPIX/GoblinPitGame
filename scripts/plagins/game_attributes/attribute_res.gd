class_name Attribute extends Node

signal value_changed(value)
signal min_value_changed(value)
signal max_value_changed(value)

@export_category('Values')
@export var value := 0.0:
	set(new_value):
		value = new_value
		value_changed.emit(value)

@export var min_value := 0.0:
	set(new_value):
		min_value = new_value
		min_value_changed.emit(min_value)
		
@export var max_value := -1.0:
	set(new_value):
		max_value = new_value
		max_value_changed.emit(max_value)
