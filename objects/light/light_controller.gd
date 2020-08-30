class_name LightController
extends Light2D

onready var light_emitter: LightEmitter = $LightEmitter

func turn_off() -> void:
	enabled = false
	light_emitter.turn_off()

func turn_on() -> void:
	enabled = true
	light_emitter.turn_on()

func receive_power(powered: bool) -> void:
	if powered:
		turn_on()
	else:
		turn_off()
