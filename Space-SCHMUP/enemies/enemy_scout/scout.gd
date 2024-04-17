extends CharacterBody2D


@export var minSpeed = 10
@export var maxSpeed = 18

func _physics_process(_delta):

	scout_animations()
	move_and_slide()


func scout_animations ():
	$AnimatedSprite2D.play("idle")
