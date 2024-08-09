extends Area2D

signal collected

func _on_body_entered(body):
	emit_signal("collected")
	print("Collected!")
	body.power_up_number += 1
	queue_free()
