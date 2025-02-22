class_name CharacterControllerReceiver extends Node

signal character_controller_changed(character_controller: CharacterController)

@export var _action_move: ActionMove
@export var _action_turn: ActionTurn
@export var _move_speed_attribute: Attribute
@export var _cursor_3d: Cursor3D

@export var _character_controller: CharacterController:
	set(value):
		_character_controller = value
		character_controller_changed.emit(value)

@export_category('Flags')
@export var is_disabled = false

func _physics_process(delta: float) -> void:
	if is_disabled: return
	mevement()
	turning()
	
func mevement():
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')

	if move_input_dir == Vector2.ZERO: return
	var dir = Vector3(move_input_dir.x, 0, move_input_dir.y)
	_action_move.move(dir, _move_speed_attribute.value)

func turning():
	_action_turn.turn(_cursor_3d.transform.origin)
	
func _on_character_controller_key_pressed():
	pass

func _on_character_controller_key_released():
	pass
