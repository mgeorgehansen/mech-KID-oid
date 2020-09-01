tool
class_name LightController
extends Light2D

export var on: bool = false

onready var light_emitter: LightEmitter = $LightEmitter
onready var animation: AnimatedSprite = $Animation

func _ready() -> void:
	_toggle(on)

func _toggle(on_: bool) -> void:
	if on_:
		turn_on()
	else:
		turn_off()

func turn_off() -> void:
	on = false
	enabled = false
	light_emitter.turn_off()
	animation.play("idle")

func turn_on() -> void:
	on = true
	enabled = true
	light_emitter.turn_on()
	animation.play("lit_af")

func receive_power(powered: bool) -> void:
	if powered:
		turn_on()
	else:
		turn_off()
