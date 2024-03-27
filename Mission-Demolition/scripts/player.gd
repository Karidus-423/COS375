extends CharacterBody2D

var bomb_pos : Vector2
var mouse_down: bool
var has_started: bool

var test_cannon = preload("res://scenes/cannon.tscn")

func _ready():
    bomb_pos = $Player.global_position
    has_started = false

func _process(delta):
    mouse_down = Input.is_action_pressed("MouseDown")
    if(mouse_down):
        has_started = true
        if(position.distance_to(get_global_mouse_position()) < 100):
            $test_cannon.global_position = get_global_mouse_position()
        else:
            $test_cannon.global_position = bomb_pos + (get_global_mouse_position()-position).normalized()*100
            
    elif(has_started):
        _shoot()
        has_started = false


func _shoot():
    print("shot")
