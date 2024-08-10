extends Area2D
@onready var timer = $Level_timer

func _on_body_entered(body):
	print("Level complete!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
func _on_timer_timeout():
	print("timer ended. Reloading world:")
	Engine.time_scale = 1
	get_tree().reload_current_scene()
