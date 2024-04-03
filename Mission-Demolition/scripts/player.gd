extends CharacterBody2D

var Bomb = load("res://scenes/cannon.tscn")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var b = Bomb.instantiate()
			b.position = event.position
			add_child(b)
