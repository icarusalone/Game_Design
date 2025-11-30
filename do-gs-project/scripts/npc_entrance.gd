extends Node

@export var walk_speed: float = 1.5
@export var entrance_marker: Node3D
@export var target_marker: Node3D

signal npc_entered(npc)

func _ready():
	# Place NPC at the entrance
	get_parent().global_transform.origin = entrance_marker.global_transform.origin
	#await get_tree().create_timer(5).timeout
	#walk_in()
	


func walk_in():
	var npc = get_parent()
	while npc.global_transform.origin.distance_to(target_marker.global_transform.origin) > 0.1:
		var direction = (target_marker.global_transform.origin - npc.global_transform.origin).normalized()
		npc.global_translate(direction * walk_speed * get_process_delta_time())
		await get_tree().process_frame

	emit_signal("npc_entered", npc)
