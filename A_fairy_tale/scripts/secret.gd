extends Area2D

#Variables
signal collected
@onready var sound_secret = $secret
var collectable = true
var level_name = ""

func _ready():
	level_name = get_tree().get_current_scene().name
	if GlobalVariables.collected_secrets[level_name]:
		# if already collected, hide secret
		visible = false

# Handles collection of secrets
func _on_body_entered(_body):
	if collectable and not GlobalVariables.collected_secrets[level_name]:
		emit_signal("collected")
		print("Secret collected! Previous number: ", GlobalVariables.secret_number)
		GlobalVariables.secret_number += 1 
		GlobalVariables.collected_secrets[level_name] = true
		print("New secret total: ", GlobalVariables.secret_number)
		sound_secret.play()
		visible = false
		collectable = false
