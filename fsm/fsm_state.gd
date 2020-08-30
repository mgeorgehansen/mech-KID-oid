class_name FsmState
extends Node
# Base interface for all states: it doesn't do anything by itself,
# but forces us to pass the right arguments to the methods below
# and makes sure every State object had all of these methods.
# Taken from https://github.com/godotengine/godot-demo-projects/tree/3.2-8d9d58f/2d/finite_state_machine

# warning-ignore:unused_signal
signal transition_to(next_state_name, args)

# Initialize the state. E.g. change the animation.
func on_enter(_args: Dictionary) -> void:
	pass


# Clean up the state. Reinitialize values like a timer.
func on_exit() -> void:
	pass


func on_input(_event: InputEvent) -> void:
	pass


func on_update(_delta: float) -> void:
	pass


func _on_animation_finished(_anim_name: String) -> void:
	pass
