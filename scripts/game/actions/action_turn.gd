class_name ActionTurn extends Action

@export var _default_turn_speed := 10

func turn(target_position: Vector3, _turn_speed: float = _default_turn_speed): # Поворот вокруг своей оси 
	if _is_disabled: return
	
	target_position.y = owner.global_transform.origin.y
	if target_position == owner.global_transform.origin: return
	
	var target_transform = owner.global_transform.looking_at(target_position)
	owner.global_transform = owner.global_transform.interpolate_with(target_transform, _turn_speed * get_physics_process_delta_time())
	
