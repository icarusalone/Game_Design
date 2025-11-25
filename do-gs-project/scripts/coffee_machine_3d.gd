extends StaticBody3D

var makecoffee_scence = load("res://scenes/coffee_minigame.tscn")
var makecoffee

#doesnt work yet
func interact() -> void:
	makecoffee = makecoffee_scence.instantiate()
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_DISABLED
	get_tree().root.add_child(makecoffee)
	%Player._free_mouse()
	
