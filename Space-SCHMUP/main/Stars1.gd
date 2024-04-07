extends ParallaxLayer

@export var STAR_SPEED_1 : float = 15

func _process(delta: float) -> void:
    self.motion_offset.y += STAR_SPEED_1 * delta
