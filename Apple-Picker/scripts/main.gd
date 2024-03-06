extends Node2D

@export var apple: PackedScene

var score
var lives
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	pass # Relace with function body.


func game_over():
	$AppleTimer.Stop()

func new_game():
	lives = 3
	score = 0
	$StartTimer.start()


func _on_apple_timer_timeout():
	var apple_instance = apple.instantiate()	
	var apple_spawn_location = $ApplePath/AppleSpawnLocation
	apple_spawn_location.progress_ratio = randf()

	var direction = apple_spawn_location.rotation + PI/2
	# Set the apple's position to a random location.
	apple_instance.position = apple_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	apple_instance.rotation = direction

	# Choose the velocity for the apple_instance.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	apple_instance.linear_velocity = velocity.rotated(direction)

	# Spawn the apple by adding it to the Main scene.
	add_child(apple_instance)
	apple.collect.connect($UI/ScoreLabel._on_apple_collected.bind())


func _on_start_timer_timeout():
	$AppleTimer.start()	
	pass # Replace with function body.


func _on_lives_label_death():
	game_over()
	pass # Replace with function body.
