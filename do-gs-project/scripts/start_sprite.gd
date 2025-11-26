extends Sprite2D

var default = load('res://assets/sprites/menu/start_0.png')
var select = load('res://assets/sprites/menu/start_1.png')


func _on_start_mouse_entered() -> void:
	print("entered")
	self.texture = default


func _on_start_mouse_exited() -> void:
	print("exited")
	self.texture = select
