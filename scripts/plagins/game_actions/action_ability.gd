class_name Ability extends Action

signal state_changed(current, previous)
signal cooldown_updated(total, value)

@export var _name: StringName
@export_multiline var _description: String
@export var _icon: CompressedTexture2D

@export_category('Timings')
@export var cooldown_time: float = 0.2

@export_category("Cost")
@export var _cost: float = 0

@export_category('Additionally')
@export var _preparation_time: float = 0.1
@export var _execution_time: float = 0.01
@export var _recovery_time: float = 0.1
@export var _cancel_time: float = 0.2

var Fsm = FSM.new()

var READY_STATE = FSM_State.new('Ready', [
		FSM_Transition.new('Preparation')
	])
var PREPARATION_STATE = FSM_State.new('Preparation', [
		FSM_Transition.new('Execution')
	])
var EXECUTION_STATE = FSM_State.new('Execution', [
		FSM_Transition.new('Recovery')
	])
var RECOVERY_STATE = FSM_State.new('Recovery', [
		FSM_Transition.new('Cooldown')
	])
var COOLDOWN_STATE = FSM_State.new('Cooldown', [
		FSM_Transition.new('Ready')
	])

func _init() -> void:
	Fsm.add_child(READY_STATE)
	Fsm.add_child(PREPARATION_STATE)
	Fsm.add_child(EXECUTION_STATE)
	Fsm.add_child(RECOVERY_STATE)
	Fsm.add_child(COOLDOWN_STATE)
	add_child(Fsm)

func get_description() -> String:
	return _description

func get_icon():
	return _icon
