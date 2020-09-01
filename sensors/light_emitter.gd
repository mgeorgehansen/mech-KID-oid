tool
class_name LightEmitter
extends Area2D

onready var collision_shape: CollisionShape2D = $CollisionShape2D

export(bool) var emitting = true
var active_sensors = {}

func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")
	connect("area_exited", self, "_on_area_exited")


func _physics_process(delta: float) -> void:
	if not emitting:
		return

	for sensor in active_sensors.values():
		sensor.sense(global_position)


func _on_area_entered(area: Area2D) -> void:
	var sensor := area as LightSensor
	assert(sensor != null, "non-LightSensor on the light layer (path=" + area.get_path() + ")")
	active_sensors[sensor.get_rid()] = sensor


func _on_area_exited(area: Area2D) -> void:
	var sensor := area as LightSensor
	active_sensors.erase(sensor.get_rid())


func turn_off() -> void:
	emitting = false
	collision_shape.disabled = true


func turn_on() -> void:
	emitting = true
	collision_shape.disabled = false
