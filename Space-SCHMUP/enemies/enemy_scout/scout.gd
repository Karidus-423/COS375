extends CharacterBody2D

signal damaged

@export var minSpeed = 10
@export var maxSpeed = 18

func _physics_process(_delta):

	if velocity > Vector2(0,0):
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("explode")

	move_and_slide()


func scout_animations ():
	$AnimatedSprite2D.play("idle")

func _on_area_2d_body_entered(_body:Node2D) -> void:
	damaged.emit()


func _on_damaged() -> void:
	velocity = Vector2(0,0)
	position = position
	$Sprite2D.hide()

func _on_shooting_timer_timeout() -> void:
	var projectileType = load("res://enemies/enemy_scout/scout_projectile/scout_bullet.tscn")
	var projectile = projectileType.instantiate()
	projectile.position = position + Vector2(0,+3)
	get_parent().add_child(projectile)


## Deaths
func _on_animation_finished() -> void:
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()



