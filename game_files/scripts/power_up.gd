extends Area2D

#Variables
signal collected
@onready var sound_power_up = $power_up
var collectable = true

# Handles collection of power ups
func _on_body_entered(_body):
	if collectable == true:
		emit_signal("collected")
		print("Power-up collected! Previous number: ", GlobalVariables.power_up_number)
		GlobalVariables.power_up_number += 1 
		print("New Power-up total: ", GlobalVariables.power_up_number)
		sound_power_up.play()
		visible = false
		collectable = false
