extends Control

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)
	$BlackOverlay.visible = true
	DialogueManager.show_dialogue_balloon(load("res://dialogues/00_letter_mum.dialogue"))
	Global_Values.in_dialogue = true

func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	if resource.resource_path.ends_with("00_letter_mum.dialogue"):
		$BlackOverlay.visible = false
		%EntranceBehaviour.walk_in()
	Global_Values.in_dialogue = false


func _on_entrance_behaviour_npc_entered(npc: Variant) -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogues/01_01.dialogue"))
	Global_Values.in_dialogue = true
