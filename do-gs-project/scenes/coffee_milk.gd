extends Area2D

var pressed = false
@onready var milktimer = $milktimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")


func _on_milktimer_timeout() -> void:
	pressed = false #after the milk has been added we can click the milk again


func _on_milk_button_pressed() -> void:
	if pressed == false: #so we cant start adding mil again while adding milk
		if coffee_cup.cup_on_plate:
			pressed = true
			milktimer.start()
