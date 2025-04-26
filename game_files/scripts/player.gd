extends CharacterBody2D

#Variables
const SPEED = 100.0
var JUMP_VELOCITY = -200.0
var gravity = 980
var jumps_remaining = 1
var jump_maximum = 1

@onready var animated_sprite = $AnimatedSprite2D
@onready var sound_player_jump = $player_jump

# Handles power ups, refferencing Autoloader GlobalVariables
func power_up_modifier():
	var power_up_number = GlobalVariables.power_up_number
	if power_up_number > 2:
		jump_maximum = 10000
		JUMP_VELOCITY = -200;
		gravity = 600
	elif power_up_number >1:
		jump_maximum = 2
		JUMP_VELOCITY = -320;
	elif power_up_number > 0:
		JUMP_VELOCITY = -320;
	else: 
		pass

# Main movement function
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handles jump, altered by power up modifier
	if is_on_floor():
		jumps_remaining = jump_maximum
	if Input.is_action_just_pressed("jump") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY
		sound_player_jump.play()
		jumps_remaining -= 1 

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	power_up_modifier()
	move_and_slide()
