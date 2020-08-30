class_name KidFsm
extends Fsm

onready var idle = $Idle
onready var investigate = $Investigate

func _ready():
	states_map = {
		"idle": idle,
		"investigate": investigate,
	}

func on_sense(src_position: Vector2) -> void:
	if current_state.has_method("on_sense"):
		current_state.on_sense(src_position)
