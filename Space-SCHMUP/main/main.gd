extends Node2D

@export var speed = 50

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	var scoutScene = load("res://enemies/enemy_scout/scout.tscn")
	var scout = scoutScene.instantiate()
	# Choose a random location on Path2D.
	var scout_spawn_location = $SpawnPath/SpawnLocation
	scout_spawn_location.progress_ratio = randf()


	# Set the scout's position to a random location.
	scout.position = scout_spawn_location.position

	# Choose the velocity for the scout.
	scout.velocity = Vector2(0,speed)
	add_child(scout)
