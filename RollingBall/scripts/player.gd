extends CharacterBody3D
@onready var animation_player = $AnimationPlayer
@onready var camera_mount = $cameraMount
const speed = 5.0
const jumpVelocity = 4.5
@export var sprintSpeed = 5
@onready var visuals = $visuals
var slide_vector = Vector2.ZERO
var slide_speed = 10.0
signal hit
signal dodge
var dodges = 0
#Export makes var accesible on the Inspector
@export var sensHorizontal = 0.5

#Gets gravity from project setting to be in sync with all nodes
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Capture mouse
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x*sensHorizontal))
		
func _physics_process(delta):
	# Iterate through all collisions that occurred this frame
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)

		# If the collision is with ground
		if collision.get_collider() == null:
			continue

		# If the collider is with a mob
		if collision.get_collider().is_in_group("collectible"):
			var mob = collision.get_collider()
			# If so, we squash it and bounce.
			mob.squash()
			# Prevent further duplicate calls.
			break
	#Add Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	#Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jumpVelocity
		
	#Get input direction and hadlle movement/deceleration.
	var input_dir = Input.get_vector("left","right","forward","backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if animation_player.current_animation != "spin_forward":
			animation_player.play("spin_forward")
		
		#Make model look at the direction they are walking to.
		visuals.look_at(position + direction)
		if Input.is_action_pressed("sprint"):
			velocity.x = direction.x * (speed * sprintSpeed)
			velocity.z = direction.z * (speed * sprintSpeed)
		else:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		
	else:
		if animation_player.current_animation != "idle":
			animation_player.play("idle")
			
		velocity.x = move_toward(velocity.x, 0 ,speed)
		velocity.z = move_toward(velocity.z, 0 ,speed)
		
	move_and_slide()


# Emitted when the player was hit by a mob.
func die():
	hit.emit()
	queue_free()

func _on_detector_body_entered(_body):
	die()
