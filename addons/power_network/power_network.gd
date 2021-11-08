tool
class_name PowerNetwork
extends Resource

var power_sources := []
var network := []


# Each node represents a connection between two components: an upstream
# component which sends power on one of its output lanes, and a downstream
# component which receives power on one of its input lanes.
class PowerConnection:
	var _upstream: PowerPort
	var _downstream: PowerPort
	
	var id: String
	var children = []

	func _init(
		upstream: PowerPort,
		downstream: PowerPort
	):
		self.id = upstream.power_lane_id() + "=>" + downstream.power_lane_id()
		self._upstream = upstream
		self._downstream = downstream
	
	func can_be_powered() -> bool:
		return self._upstream.can_be_powered()
	
	func power():
		self._downstream.power()
	
	func depower():
		self._downstream.depower()


func update_power():
	var powered_nodes = {}
	# 1. For each power source, flood-fill the network from that source and
	#    send power to each connected node, letting each node in turn determine
	#    whether to send power to connecting nodes.
	for src in power_sources:
		_power_nodes(src, powered_nodes)


func add_electrical_comp(comp: ElectricalComp) -> void:
	for power_lane in comp.power_lanes():
		power_lane = power_lane as PowerPort


func _power_nodes(src: PowerConnection, powered_connections: Dictionary):
	var visited = {}
	var connections_to_visit = [src]
	while connections_to_visit.count() > 0:
		var connection: PowerConnection = connections_to_visit.pop_back()
		if visited[connection.id]:
			continue
		visited[connection.id] = true
		# Optimization: don't revisit nodes that are already powered by another
		# power source.
		if powered_connections[connection.id]:
			continue
		if !connection.can_be_powered():
			connection.depower()
			continue
		connection.power()
		powered_connections[connection.id] = true

		for child in connection.children:
			connections_to_visit.push_back(child)
