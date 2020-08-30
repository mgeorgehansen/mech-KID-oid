class_name LightSensor
extends Area2D

signal triggered(src_position)

func _ready() -> void:
	collision_layer = 0b100
	collision_mask = 0b100


func sense(src_position: Vector2) -> void:
	emit_signal("triggered", src_position)
