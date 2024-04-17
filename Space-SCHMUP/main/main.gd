extends Node2D


@export var scout_scene: PackedScene
func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var mob = scout_scene.instantiate()
	# Choose a random location on Path2D.
	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
