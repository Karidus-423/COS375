extends CharacterBody2D


@export var max_speed = 400.0
@export var acceleration = 1500.0
@export var friction = 600.0

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)
	player_animation()

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()

	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction*delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)

	move_and_slide()


func player_animation():
	if Input.is_action_pressed("ui_right") == true:
		$PlayerAnimation.play("move_right")
	elif Input.is_action_pressed("ui_left") == true:
		$PlayerAnimation.play("move_left")
	else:
		$PlayerAnimation.play("idle")
		
