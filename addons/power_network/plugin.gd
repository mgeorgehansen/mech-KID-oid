tool
extends EditorPlugin

#var editing_power_network = null
#
#var editor_selection = get_editor_interface().get_selection()
#
#func _on_selection_change() -> void:
#	var selected_nodes = editor_selection.get_selected_nodes()
#	if selected_nodes.count > 1:
#		editing_power_network = null
#		return
#	var selected_node = selected_nodes[0]
#	if selected_node is PowerNetworkContainer:
#		editing_power_network = selected_node
#	else:
#		editing_power_network = null
#
#func _ready() -> void:
#	editor_selection.connect("selection_changed", self, "_on_selection_changed")
#
#
#func _process(delta: float) -> void:
#	if editing_power_network

#var selected_power_network = null
#
#func edit(object: Object) -> void:
#	selected_power_network = object
#
#func handles(object: Object) -> bool:
#	return object is ElectricalComp
#
#func forward_canvas_draw_over_viewport(overlay: Control) -> void:
#	if not selected_comp or not selected_comp.is_inside_tree():
#		return
#	var position = selected_comp.position
#
#	var transform = selected_comp.get_viewport_transform() * selected_comp.get_canvas_transform();
##	for lane in selected_comp.input_lanes():
##		overlay.draw_circle(transform * (position + i_pos), 50, Color.blue)
#
#func _enter_tree() -> void:
#	pass
#
#func _exit_tree() -> void:
#	pass
