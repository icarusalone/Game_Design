extends Node2D
@onready var serve_button: Button = $serve/Sprite2D/serve_button

const _3D_SCENE = preload("res://scenes/3d_scene.tscn")

var player: Node = null
func set_player(p):
	player = p

func _on_serve_button_pressed() -> void:
	player._capture_mouse()
	queue_free()
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_INHERIT
