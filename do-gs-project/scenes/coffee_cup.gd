extends Area2D

@onready var coffee_plate = get_parent().get_node("coffee_plate")

var dragging = false
var offset = Vector2(0,0)
var cup_on_plate = false

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
	if cup_on_plate:
		position = coffee_plate.plate_position - Vector2(50,70)


func _on_coffee_plate_area_entered(area: Area2D) -> void:
	cup_on_plate = true


func _on_coffee_plate_area_exited(area: Area2D) -> void:
	cup_on_plate = false
