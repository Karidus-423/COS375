extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
    # Add the gravity.
    if not is_on_floor():
        velocity.y += gravity * delta

    # Handle jump.
    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    var direction = Input.get_axis("ui_left", "ui_right")
    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)


    for index in range(get_slide_collision_count()):
        var collision = get_slide_collision(index)

        if collision.get_collider() == null:
            continue

        if collision.get_collider().is_in_group("apple"):
            var apple = collision.get_collider()

            apple.collect()
            break


    move_and_slide()


func _on_lives_label_death():
    queue_free()