extends CharacterBody2D


@export var max_speed = 400.0
@export var acceleration = 1500.0
@export var friction = 600.0

var input = Vector2.ZERO

@onready var shield_animation = $ShieldAnimations/AnimationPlayer

func _physics_process(delta):
	player_movement(delta)
	player_animation()
	player_shooting()


### Player Input
func direction_value(movement_key_pressed) -> int:
	var direction  = int(Input.is_action_pressed(movement_key_pressed))
	return direction

func get_input():
	input.x =  direction_value("ui_right") - direction_value("ui_left") 
	input.y =  direction_value("ui_down") - direction_value("ui_up")

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

func player_shooting():
	var shoot = Input.is_action_just_pressed("ui_accept")
	var projectileType = load("res://player/player_bullet/player_bullet.tscn")
	if shoot == true:
		var projectile = projectileType.instantiate()
		projectile.position = position + Vector2(0,-50)
		projectile.add_constant_central_force(Vector2(0,-5000))
		get_parent().add_child(projectile)

func player_animation() -> void:
	if Input.is_action_pressed("ui_right") == true:
		$PlayerAnimation.play("move_right")
	elif Input.is_action_pressed("ui_left") == true:
		$PlayerAnimation.play("move_left")
	else:
		$PlayerAnimation.play("idle")
		shield_animation.play("tier-1")
