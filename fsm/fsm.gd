class_name Fsm
extends Node
# Base interface for a generic state machine.
# It handles initializing, setting the machine active or not
# delegating _physics_process, _input calls to the State nodes,
# and changing the current/active state.
# Taken from https://github.com/godotengine/godot-demo-projects/tree/3.2-8d9d58f/2d/finite_state_machine

signal state_changed(current_state)

# You should set a starting node from the inspector or on the node that inherits
# from this state machine interface. If you don't, the game will default to
# the first state in the state machine's children.
export(NodePath) var start_state
var states_map = {}

var states_stack = []
var current_state: FsmState = null
var _active: bool = false setget set_active

func _ready() -> void:
	if not start_state:
		start_state = get_child(0).get_path()
	for child in get_children():
		var err = child.connect("transition_to", self, "_change_state")
		if err:
			printerr(err)
	initialize(start_state)


func initialize(initial_state) -> void:
	set_active(true)
	states_stack.push_front(get_node(initial_state))
	current_state = states_stack[0]
	current_state.on_enter({})


func set_active(value: bool) -> void:
	_active = value
	set_physics_process(value)
	set_process_input(value)
	if not _active:
		states_stack = []
		current_state = null


func _unhandled_input(event: InputEvent) -> void:
	current_state.on_input(event)


func _physics_process(delta: float) -> void:
	current_state.on_update(delta)


func _on_animation_finished(anim_name: String) -> void:
	if not _active:
		return
	current_state._on_animation_finished(anim_name)


func _change_state(state_name: String, args: Dictionary) -> void:
	if not _active:
		return
	current_state.on_exit()

	# NOTE: Not sure I like having a special string value for popping the state
	# stack...
	if state_name == "previous":
		states_stack.pop_front()
	else:
		states_stack[0] = states_map[state_name]

	current_state = states_stack[0]
	emit_signal("state_changed", current_state)

	if state_name != "previous":
		current_state.on_enter(args)
