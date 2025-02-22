class_name AttributeManager extends Node

func get_attribute(attribute_name: String) -> Attribute:
	return get_node_or_null(attribute_name)
