extends StaticBody3D


var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    velocity = Vector3(0,0.1,0)
    move_and_collide(velocity)
