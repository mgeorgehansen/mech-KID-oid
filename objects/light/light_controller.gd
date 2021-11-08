tool
class_name LightController
extends Light2D

func receive_power(powered: bool) -> void:
	if powered:
		turn_on()
	else:
		turn_off()


func _ready() -> void:
	turn_off()


func _toggle(on_: bool) -> void:
	if on_:
		turn_on()
	else:
		turn_off()


func turn_off() -> void:
	enabled = false
	_light_emitter.turn_off()
	_animation.play("idle")


func turn_on() -> void:
	enabled = true
	_light_emitter.turn_on()
	_animation.play("lit_af")

onready var _light_emitter: LightEmitter = $LightEmitter
onready var _animation: AnimatedSprite = $Animation
onready var _input: PowerPort = $Input
