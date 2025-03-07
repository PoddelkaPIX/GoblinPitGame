@icon('uid://bilrk5sajq8d')
class_name Character extends CharacterBody3D

var gravity: float = ProjectSettings['physics/3d/default_gravity']

func _physics_process(delta: float) -> void:
	move_and_slide()
	friction(delta)
	apply_gravity(delta)

func friction(delta):
	var h_friction: float = 20.0
	
	if not is_on_floor():
		h_friction /= 10
		
	velocity.x = lerp(velocity.x, 0.0, h_friction * delta)
	velocity.z = lerp(velocity.z, 0.0, h_friction * delta)

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y -= delta * gravity

func push(direction: Vector3):
	velocity += get_physics_process_delta_time() * direction

func _on_movement_fsm_state_changed(current_state: FSM_State) -> void:
	%StateLabel.text = current_state.name
