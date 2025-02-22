class_name Menu extends Control

func show_node(node: Control):
	for childe in get_children():
		childe.visible = false
	
	node.visible = true

func _to_initial_state():
	pass
