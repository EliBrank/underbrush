extends CharacterBody2D

const SPEED = 100.0
var JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980

var power_up_number = 0

var jumps_remaining = 1
var jump_maximum = 1

@onready var animated_sprite = $AnimatedSprite2D

func power_up_modifier():
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


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if is_on_floor():
		jumps_remaining = jump_maximum
	if Input.is_action_just_pressed("jump") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY
		jumps_remaining -= 1 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	power_up_modifier()
	move_and_slide()
