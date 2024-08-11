extends Node2D

# Variables
var center = Vector2()      # Center of the circle
var radius = 20             # Radius of the circle
var speed = 400              # Speed of rotation (radians per second)
var angle = 0               # Current angle in radians

func _ready():
	# Set the center of the circle to the initial position of the enemy
	center = position

func _process(delta):
	# Calculate the circumference of the circle
	var circumference = 2 * PI * radius
	
	# Calculate the angular speed based on linear speed
	var angular_speed = speed / circumference
	
	# Increment the angle based on the angular speed and delta time
	angle += angular_speed * delta

	# Calculate the new position based on the angle
	var new_x = center.x + radius * cos(angle)
	var new_y = center.y + radius * sin(angle)
	
	# Update the position of the enemy
	position = Vector2(new_x, new_y)
