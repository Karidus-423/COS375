extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
    # Add the gravity.
    if not is_on_floor():
        velocity = Vector3(0,0.01,0)
        move_and_collide(velocity)
        # Rotate around the object's local X axis by 0.1 radians.
        rotate_object_local(Vector3(1, 0, 0), 0.01)
        rotate_object_local(Vector3(0, 1, 0), 0.01)
        rotate_object_local(Vector3(0, 0, 1), 0.01)


    move_and_slide()
