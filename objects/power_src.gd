tool
class_name PowerSrc
extends ElectricalComp

export(bool) var transmitting: bool = true setget _set_transmitting_power

signal powered(is_powered)

onready var _output: PowerPort = $Output

func _ready() -> void:
	var err = _output.connect("powered", self, "_on_powered")
	if OK != err:
		push_error(err)
	_output.set_powered(transmitting)


func _set_transmitting_power(transmitting_: bool) -> void:
	transmitting = transmitting_
	_output.set_powered(transmitting_)


func _on_powered(is_powered: bool) -> void:
	emit_signal("powered", is_powered)
