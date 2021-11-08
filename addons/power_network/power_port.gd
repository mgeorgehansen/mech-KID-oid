tool
class_name PowerPort
extends Node2D
# Represents an input or output power port on an ElectricalComp which can
# receive or transmit power for the component respectively.

# =============================================================================
# Public interface
# =============================================================================

enum Polarity {
	INPUT,
	OUTPUT,
}

export(Polarity) var polarity = Polarity.INPUT

signal powered(is_powered)


func set_powered(is_powered: bool) -> void:
	emit_signal("powered", is_powered)


func power_lane_id() -> String:
	return get_path().get_concatenated_subnames()


# =============================================================================
# Virtual overrides
# =============================================================================

func _draw() -> void:
	if Engine.is_editor_hint():
		_draw_editor_gizmos()


func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		update()


# =============================================================================
# Private
# =============================================================================

func _draw_editor_gizmos() -> void:
	_draw_circle_unfilled(Vector2.ZERO, 2, Color.blue)
	if polarity == Polarity.INPUT:
		draw_circle(Vector2.ZERO, 1, Color.black)
	else:
		draw_line(Vector2(0, -2), Vector2(0, 2), Color.red, 1.1)


func _draw_circle_unfilled(
	center: Vector2,
	radius: float,
	color: Color,
	line_width: float = 1.0,
	n_points: int = 100
) -> void:
	var angle_increment = 2 * PI / n_points
	var points := PoolVector2Array()
	for i in range(n_points + 1):
		var angle = i * angle_increment
		var y = radius * cos(90 - angle)
		var x = radius * sin(90 - angle)
		var point = center + Vector2(x, y)
		points.append(point)
	draw_polyline(points, color, line_width, true)

