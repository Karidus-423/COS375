extends Label

var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_apple_missed():
	lives -= 1
	text = "Lives: %s" % lives

	if (lives == 0){

	}
