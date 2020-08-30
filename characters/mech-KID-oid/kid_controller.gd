class_name KidController
extends KinematicBody2D

const GRAVITY = 10.0
const MAX_VELOCITY = 400.0

export(float) var max_walk_speed = 50

onready var animation: AnimatedSprite = $Animation
onready var states: KidFsm = $States

var velocity = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	velocity.y += GRAVITY
	velocity.y = clamp(velocity.y, -MAX_VELOCITY, MAX_VELOCITY)
	move_and_slide(velocity, Vector2.UP)


func walk_towards(src_position: Vector2) -> void:
	var distance_x = (src_position.x - global_position.x)
	var direction: Vector2
	if distance_x < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT
	animation.play("walk")
	if direction.x < 0:
		animation.flip_h = true
	else:
		animation.flip_h = false
	self.velocity.x = max_walk_speed * direction.x


func stop_moving() -> void:
	self.velocity.x = 0;

# Delegate to the state machine when the mech-KID-oid senses something.
func _on_sensor_triggered(src_position: Vector2) -> void:
	states.on_sense(src_position)
