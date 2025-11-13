extends Area2D

var filled = false
var pressed = false
@onready var coffeemachinetimer = $coffeemachinetimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")

func _on_button_pressed() -> void:
	if pressed == false:
		if coffee_cup.cup_on_plate:
			pressed = true
			coffeemachinetimer.start()
		
