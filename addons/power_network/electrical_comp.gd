tool
class_name ElectricalComp
extends Node2D

var _power_ports := {}


func _ready() -> void:
	for child in get_children():
		var power_port = child as PowerPort
		if power_port:
			_power_ports[power_port.power_lane_id()] = power_port
