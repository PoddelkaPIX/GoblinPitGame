class_name ActionMove extends Action

signal moving(dir: Vector3, power: int)

func move(dir: Vector3, power: int) -> void:
	if _is_disabled: return
	
	if dir != Vector3.ZERO:
		owner.velocity = lerp(owner.velocity, dir * power, get_physics_process_delta_time())
		moving.emit(dir, power)

func _execute():
	pass

func _stop():
	pass
