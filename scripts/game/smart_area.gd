class_name SmartArea extends Area3D

var bodies = []

func _init() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	bodies.append(body)
	
func _on_body_exited(body):
	bodies.erase(body)
