extends Area2D

# Variables
@onready var timer = $Timer
@onready var sound_hurt = $hurt

# Called when character enters killzone
func _on_body_entered(body):
	print("you died!")
	Engine.time_scale = 0.25
	
	# Deletes player object's collision
	body.get_node("CollisionShape2D").queue_free()
	sound_hurt.play()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	
	# Reloads current scene
	get_tree().reload_current_scene()
