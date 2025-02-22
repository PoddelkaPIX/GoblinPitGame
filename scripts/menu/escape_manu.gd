extends Menu

@onready var escape_menu_container: Control = %EscapeMenuContainer
@onready var settings_menu: Control = %SettingsMenu

func _ready() -> void:
	_to_initial_state()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel'):
		_toogle_visible()

func _on_settings_btn_pressed() -> void:
	show_node(settings_menu)

func _on_continue_btn_pressed() -> void:
	_toogle_visible()

func _toogle_visible():
	visible = !visible
	get_tree().paused = visible
	if !visible: _to_initial_state()

func _on_exit_btn_pressed() -> void:
	var main_node: MainNode = get_tree().current_scene
	main_node.return_to_main_menu()
	get_tree().paused = false

func _to_initial_state():
	show_node(escape_menu_container)
	visible = false
