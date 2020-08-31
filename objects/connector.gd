tool
class_name Connector
extends Node2D

var _upstream: Node2D
var _downstream: Node2D
var _powered: bool = false


func _ready() -> void:
	_upstream = get_parent()
	if !_upstream.has_method("receive_power"):
		push_error("parent of Connector " + get_path() + " does not have receive_power method")
	_downstream = get_child(0)
	if _downstream != null and !_downstream.has_method("receive_power"):
		push_error("child of Connector " + get_path() + " does not have recieve_power method")


func _draw() -> void:
	if _downstream == null or _upstream == null:
		return
	
	var points = PoolVector2Array()
	points.push_back(_relative_position(_upstream.global_position))
	points.push_back(_relative_position(
		Vector2(_downstream.global_position.x, _upstream.global_position.y)
	))
	points.push_back(_relative_position(_downstream.global_position))
	draw_polyline(points, Color.red if _powered else Color.gray)


func _relative_position(pos: Vector2) -> Vector2:
	return pos - global_position

func _process(_delta: float) -> void:
	update()


func receive_power(powered: bool) -> void:
	_powered = powered
	_upstream.receive_power(powered)
	_downstream.receive_power(powered)
