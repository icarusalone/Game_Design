extends StaticBody3D

#doesnt work yet
func interact() -> void:
	var makecoffee_scence = load("res://scenes/coffee_minigame.tscn")
	var makecoffee = makecoffee_scence.instantiate()
	add_child(makecoffee)
