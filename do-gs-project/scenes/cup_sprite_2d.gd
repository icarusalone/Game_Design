extends Sprite2D

@onready var coffee_cup = get_parent()

var level1 = load('res://assets/sprites/coffee_minigame/coffee_1_placeholder.png')
var level2 = load('res://assets/sprites/coffee_minigame/coffee_2_placeholder.png')
var level3 = load('res://assets/sprites/coffee_minigame/coffee_3_placeholder.png')
var level = 0

func _on_coffeemachinetimer_timeout() -> void:
	if coffee_cup.cup_on_plate:
		self.texture = level3
		level = 3


func _on_milktimer_timeout() -> void:
	print("test")
	if level == 3:
		self.texture = level2
		level = 2
	elif level == 2:
		self.texture = level1
		level = 1
