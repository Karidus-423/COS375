extends RigidBody2D

signal collected
signal dropped

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_enabler_2d_screen_exited():
	dropped.emit()
	queue_free()


func collect():
	collected.emit()
	queue_free()
