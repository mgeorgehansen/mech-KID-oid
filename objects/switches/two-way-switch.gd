tool
class_name TwoWaySwitch
extends ElectricalComp

# =============================================================================
# Public interface
# =============================================================================

enum SwitchState { LEFT_OPEN, RIGHT_OPEN }

export(SwitchState) var switch_state = SwitchState.LEFT_OPEN

signal left_powered(is_powered)
signal right_powered(is_powered)

func receive_power(is_powered: bool) -> void:
	_input.set_powered(is_powered)


func toggle() -> void:
	var new_state
	if switch_state == SwitchState.LEFT_OPEN:
		new_state = SwitchState.RIGHT_OPEN
	else:
		new_state = SwitchState.LEFT_OPEN
	_set_switch_state(new_state)


# =============================================================================
# Virtual overrides
# =============================================================================

func _ready() -> void:
	var err = _click_trigger.connect("input_event", self, "_on_input_event")
	if OK != err:
		push_error(err)
	err = _input.connect("powered", self, "_on_input_powered")
	if OK != err:
		push_error(err)
	err = _left_output.connect("powered", self, "_on_left_output_powered")
	if OK != err:
		push_error(err)
	err = _right_output.connect("powered", self, "_on_right_output_powered")
	if OK != err:
		push_error(err)
	_set_switch_state(switch_state)
	

func _set_switch_state(new_state) -> void:
	switch_state = new_state
	_play_animation()
	_inactive_output().set_powered(false)
	_active_output().set_powered(true)


func _on_input_event(_viewport: Object, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("mouse_press"):
		toggle()


func _on_input_powered(powered: bool) -> void:
	_active_output().set_powered(powered)


func _play_animation() -> void:
	if switch_state == SwitchState.LEFT_OPEN:
		_animation.play("left-open")
	else:
		_animation.play("right-open")


func _active_output() -> PowerPort:
	return _left_output if switch_state == SwitchState.LEFT_OPEN else _right_output


func _inactive_output() -> PowerPort:
	return _right_output if switch_state == SwitchState.LEFT_OPEN else _left_output


func _on_left_output_powered(powered: bool) -> void:
	emit_signal("left_powered", powered)


func _on_right_output_powered(powered: bool) -> void:
	emit_signal("right_powered", powered)


onready var _click_trigger: Area2D = $ClickTrigger
onready var _animation: AnimatedSprite = $Animation
onready var _input: PowerPort = $Input
onready var _left_output: PowerPort = $LeftOutput
onready var _right_output: PowerPort = $RightOutput
