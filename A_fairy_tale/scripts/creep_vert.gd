extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_up = $ray_cast_up
@onready var ray_cast_down = $ray_cast_down
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if ray_cast_down.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
	elif ray_cast_up.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
	position.y += direction * SPEED * delta
