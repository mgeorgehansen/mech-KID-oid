extends FsmState

const ERROR_TOLERANCE = 1

var src_position: Vector2

func on_enter(args) -> void:
	src_position = args["src_position"]
	fixate_on(src_position)


func on_sense(new_src_position: Vector2) -> void:
	var distance_to_new_thing = owner.global_position.distance_to(new_src_position)
	var distance_to_existing_thing = owner.global_position.distance_to(src_position)
	if distance_to_new_thing < distance_to_existing_thing:
		fixate_on(new_src_position)

func fixate_on(src_position: Vector2) -> void:
	self.src_position = src_position


func on_update(_delta: float) -> void:
	owner.walk_towards(src_position)
	var distance_remaining = abs(owner.global_position.x - src_position.x)
	if distance_remaining < ERROR_TOLERANCE:
		owner.get_node("Animation").stop()
		emit_signal("transition_to", "idle", {})
