extends CharacterBody3D

var up = true

var target_position: Vector3
var move_time := 3.0
var elapsed_time := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var order_pos = Vector3(1, 1, -1)
	var tween = create_tween()
	tween.tween_property(self, "position", order_pos, 3)
	tween.play()
	
	target_position = Vector3(1, 1, -1)
	elapsed_time = 0.0
	
	DialogueManager.show_dialogue_balloon(load("res://dialogues/testdialogue.dialogue")) #plays the testdialogue


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (up):
		position.y += delta * 0.2
	if (not up):
		position.y -= delta * 0.2
	if (position.y >= 1.5):
		up = false
	if (position.y <= 1):
		up = true
	
	#print(position.x, position.y, position.z)
