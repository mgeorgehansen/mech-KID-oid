tool
class_name PowerNetworkContainer
extends Node

var power_network: PowerNetwork = null

signal electrical_comp_added(comp)
signal electrical_comp_removed(comp)


func _ready() -> void:
	if power_network == null:
		power_network = _init_power_network()


func _init_power_network() -> PowerNetwork:
	var power_network := PowerNetwork.new()
	for child in get_children():
		var comp = child as ElectricalComp
		if comp:
			power_network.add_component(comp)
	return power_network


func add_child(node: Node, legible_unique_name: bool = false) -> void:
	.add_child(node, legible_unique_name)
	var comp = node as ElectricalComp
	if comp != null:
		emit_signal("electrical_comp_added", comp)


func remove_child(node: Node) -> void:
	.remove_child(node)
	var comp = node as ElectricalComp
	if comp != null:
		emit_signal("electrical_comp_removed", comp)


func _on_electrical_comp_added(comp: ElectricalComp) -> void:
	power_network.add_component(comp)


func _on_electrical_comp_removed(comp: ElectricalComp) -> void:
	power_network.remove_component(comp)

