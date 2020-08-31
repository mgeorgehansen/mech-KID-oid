tool
class_name TwoWaySwitch
extends AnimatedSprite

signal switch_flipped(active_lane)

var connected_components = {}

export(int, 0, 1) var _active_lane: int = 0 setget _set_active_lane

func _ready() -> void:
	var lane_idx = 0;
	for child in get_children():
		if !child.has_method("receive_power"):
			continue
		assert(lane_idx <= 1, "More than two components connected to TwoWaySwitch")
		_connect_component(lane_idx, child)
		lane_idx += 1
	connect("switch_flipped", self, "_on_switch_flipped")
	_on_switch_flipped(_active_lane)


func _set_active_lane(active_lane: int) -> void:
	_active_lane = active_lane
	_on_switch_flipped(active_lane)


func _connect_component(lane: int, comp: Node) -> void:
	connected_components[lane] = comp


func _on_switch_flipped(active_lane: int) -> void:
	if active_lane == 0:
		play("01-active")
	else:
		play("02-active")
	for lane in connected_components.keys():
		connected_components[lane].receive_power(lane == active_lane)


func toggle() -> void:
	if _active_lane == 1:
		_active_lane = 0
	else:
		_active_lane = 1
	emit_signal("switch_flipped", _active_lane)


func receive_power(powered: bool) -> void:
	pass


func _on_input_event(_viewport: Object, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("mouse_press"):
		toggle()
