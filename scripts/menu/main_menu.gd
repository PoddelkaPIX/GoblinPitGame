extends Menu

@export var main_node: MainNode

@onready var story_btn: Button = %StoryBtn
@onready var arena_btn: Button = %ArenaBtn
@onready var settings_btn: Button = %SettingsBtn
@onready var exit_btn: Button = %ExitBtn

@onready var main_menu_container: VBoxContainer = %MainMenuContainer
@onready var settings_menu: Control = %SettingsMenu

func _ready() -> void:
	show_node(main_menu_container)
	
func _on_settings_btn_pressed() -> void:
	show_node(settings_menu)

func _on_exit_btn_pressed() -> void:
	get_tree().quit()

func _on_arena_btn_pressed() -> void:
	var level = preload("res://scenes/game/levels/test_level.tscn").instantiate()
	main_node.start_level(level)
