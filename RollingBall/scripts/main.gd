extends Node

@export var collectible: PackedScene



func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var jiggy = collectible.instantiate()
	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	jiggy.initialize(mob_spawn_location.position, player_position)

	# Spawn the mob by adding it to the Main scene.
	add_child(jiggy)
	jiggy.dodge.connect($UserInterface/ScoreLabel._on_mob_dodged.bind())


func _on_player_hit():
	$"Mob Timer".stop()
	$UserInterface/Retry.show()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()

func _ready():
	$UserInterface/Retry.hide()
