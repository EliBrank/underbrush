extends Area2D

@onready var timer = $Level_timer

@export var next_level: String

func _on_body_entered(body):
	print("Level complete!")
	Engine.time_scale = 0.25
	timer.start()

func _on_level_timer_timeout():
	print("timer ended. Loading next level...")
	Engine.time_scale = 1
	
	if next_level != "":
		get_tree().change_scene_to_file(next_level)
	else:
		print("no next scene set... reloading current level")
		get_tree().reload_current_scene()
