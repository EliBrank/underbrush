extends Area2D

signal collected
@onready var sound_power_up = $power_up
var collectable = true
func _on_body_entered(_body):
	if collectable == true:
		emit_signal("collected")
		print("Collected! ", GlobalVariables.power_up_number)
		GlobalVariables.power_up_number += 1 
		print(GlobalVariables.power_up_number)
		sound_power_up.play()
		visible = false
		collectable = false
