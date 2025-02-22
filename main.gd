class_name MainNode extends Node

@onready var main_menu: Control = %MainMenu

var main_scene: Node

func return_to_main_menu():
	main_menu.visible = true
	main_scene.queue_free()

func start_level(level: Level):
	main_menu.visible = false
	main_scene = level
	add_child(level)
