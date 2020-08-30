extends FsmState

func on_enter(_args: Dictionary) -> void:
	owner.get_node("Animation").play("idle")
	owner.stop_moving()

func on_sense(src_position: Vector2) -> void:
	emit_signal("transition_to", "investigate", {"src_position": src_position})

func on_update(_delta: float) -> void:
	pass
