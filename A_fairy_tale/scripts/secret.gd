extends Area2D

#Variables
signal collected
@onready var sound_power_up = $power_up
var collectable = true

# Handles collection of secrets
func _on_body_entered(_body):
	if collectable == true:
		emit_signal("collected")
		print("Collected! ", GlobalVariables.secret_number)
		GlobalVariables.secret_number += 1 
		print(GlobalVariables.secret_number)
		sound_power_up.play()
		visible = false
		collectable = false
