extends Control

@export var npc_entrance1: Node3D
@export var npc_entrance2: Node3D
@export var npc_entrance3: Node3D
@export var npc_entrance4: Node3D

var npc_queue = []
#var current_npc_index = 0
var simulation_mode = false  # Only enable key press simulation after first dialogue

func _ready() -> void:
	# Queue your NPCs in order
	npc_queue = [npc_entrance3, npc_entrance1, npc_entrance2, npc_entrance4]

	# Start initial letter dialogue
	$BlackOverlay.visible = true
	DialogueManager.show_dialogue_balloon(load("res://dialogues/00_letter_mum.dialogue"))
	Global_Values.in_dialogue = true
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)

func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	Global_Values.in_dialogue = false
	
	# When the first dialogue finishes, hide overlay and allow simulation mode
	if resource.resource_path.ends_with("00_letter_mum.dialogue"):
		$BlackOverlay.visible = false
		simulation_mode = true
		_trigger_next_npc()
		print("Press T to trigger NPCs one at a time.")
	elif resource.resource_path.ends_with("01_02.dialogue"):
		_death()
		await get_tree().create_timer(2).timeout
		DialogueManager.show_dialogue_balloon(load("res://dialogues/01_03.dialogue"))
	elif resource.resource_path.ends_with("01_03.dialogue"):
		DialogueManager.show_dialogue_balloon(load("res://dialogues/01_04.dialogue"))
	elif resource.resource_path.ends_with("01_04.dialogue"):
		_trigger_next_npc()

func _process(delta):
	if simulation_mode and Input.is_action_just_pressed("ui_accept"):  # map 'ui_accept' to T if you want
		_trigger_next_npc()

func _trigger_next_npc():
	if Global_Values.current_npc_index < npc_queue.size():
		var next_npc = npc_queue[Global_Values.current_npc_index]
		print("Triggering NPC ", Global_Values.current_npc_index + 1)
		next_npc.walk_in()
		Global_Values.current_npc_index += 1
	else:
		print("All NPCs have walked in.")

func _death():
	while %NPC3.position.y >= -3:
		print(get_process_delta_time())
		print(%NPC3.position.y)
		%NPC3.position.y -= get_process_delta_time()*2
		await get_tree().create_timer(0.01).timeout
