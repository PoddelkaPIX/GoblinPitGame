extends Control

@onready var tree: Tree = $Tree

@onready var root = tree.create_item()

func _ready() -> void:
	get_tree().node_added.connect(_on_tree_node_added)
	get_tree().node_removed.connect(_on_tree_node_removed)
	tree.hide_root = true
	
func _on_tree_node_added(node):
	if node is Character:
		var character_item = tree.create_item(root)
		var character_attributes_item = tree.create_item(character_item)
		var character_state_item = tree.create_item(character_item)
		
		character_item.set_text(0, node.name)
		character_attributes_item.set_text(0, 'Атрибуты')
		character_state_item.set_text(0, 'Состояние:')
		
		var fsm: FSM = node.get_node('FSM')
		fsm.state_changed.connect(func (state): _on_state_changed(character_state_item, state))
		
		for attribute_childe in node.get_node('AttributeManager').get_children():
			if attribute_childe is Attribute:
				var attribute = tree.create_item(character_attributes_item)
				attribute.set_text(0, attribute_childe.name)
				
				var value_item = tree.create_item(attribute)
				var max_value_item = tree.create_item(attribute)
				var min_value_item = tree.create_item(attribute)
				
				value_item.set_text(0, "value: "+str(attribute_childe.value))
				max_value_item.set_text(0, "max_value: "+str(attribute_childe.max_value))
				min_value_item.set_text(0, "min_value: "+str(attribute_childe.min_value))
				
				attribute_childe.value_changed.connect(func(value): _on_attribute_value_changed(value_item, value))
				attribute_childe.max_value_changed.connect(func(value): _on_attribute_max_value_changed(max_value_item, value))
				attribute_childe.min_value_changed.connect(func(value): _on_attribute_min_value_changed(min_value_item, value))

func _on_tree_node_removed(node):
	if node is Character:
		for character in root.get_children():
			if character.get_text(0) == node.name:
				root.remove_child(character)

func _on_attribute_value_changed(attribute_item: TreeItem, value: float):
	attribute_item.set_text(0, "value: "+str(value))

func _on_attribute_max_value_changed(attribute_item: TreeItem, value: float):
	attribute_item.set_text(0, "max_value: "+str(value))

func _on_attribute_min_value_changed(attribute_item: TreeItem, value: float):
	attribute_item.set_text(0, "min_value: "+str(value))

func _on_state_changed(item: TreeItem, state: FSM_State):
	item.set_text(1, state.name)
