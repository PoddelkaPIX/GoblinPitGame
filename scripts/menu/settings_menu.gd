extends Menu

@export var back_menu: Control

func _on_back_btn_pressed() -> void:
	self.visible = false
	back_menu.visible = true

func _return_to_initial_state():
	pass
