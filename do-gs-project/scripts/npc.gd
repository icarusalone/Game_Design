extends CharacterBody3D

#var up = true

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#var order_pos = Vector3(1, 1, -1)
	#var tween = create_tween()
	#tween.tween_property(self, "position", order_pos, 3)
	#tween.play()
	#
	##DialogueManager.show_dialogue_balloon(load("res://dialogues/testdialogue.dialogue")) #plays the testdialogue
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if (up):
		#position.y += delta * 0.2
	#if (not up):
		#position.y -= delta * 0.2
	#if (position.y >= 1.5):
		#up = false
	#if (position.y <= 1):
		#up = true
		
var player_in_range = false

func _ready():
	# Connect the area signals
	$InteractArea.body_entered.connect(_on_area_entered)
	$InteractArea.body_exited.connect(_on_area_exited)

func _on_area_entered(body):
	if body.name == "Player":  # or check by group if you prefer
		player_in_range = true

func _on_area_exited(body):
	if body.name == "Player":
		player_in_range = false

func _process(delta):
	# Only allow interaction when the player is close enough
	if player_in_range and Input.is_action_just_pressed("interact"):
		start_dialogue()

func start_dialogue():
	print("NPC: I'd like a coffee please!")   # Placeholder for now
