extends AnimationTree

#var playback: AnimationNodeStateMachinePlayback = self['parameters/playback']
#
#@export var action_move: ActionMove:
	#set(value):
		#action_move = value
		#action_move.moving.connect(_on_moving)sawasd
#
#func _on_moving(dir: Vector3, power: int):
	#playback.travel('Walk')
	#var pos: Vector2 = self['parameters/Walk/blend_position']
	#pos = Vector2(dir.x, dir.z)
