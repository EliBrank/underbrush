extends Control

@export var next_level: String
@onready var label_1 = $MarginContainer/VBoxContainer/Label1
@onready var label_2 = $MarginContainer/VBoxContainer/Label2

var letter_delay = 0.2  # delay between each letter
var animation_delay = 1.5  # additional delay

var labels: Array  # array to hold the label nodes
var current_label_index = 0

var labels_full = [
	"Congratulations!",
	"Out of 3 secrets\nyou found...\n" + num_secret_text()
]

func _ready():
	# Initialize labels array with the label nodes
	labels = [label_1, label_2]
	
	# Clear the labels' text initially
	for label in labels:
		label.text = ""
	
	print("Starting animation after delay")
	await get_tree().create_timer(animation_delay).timeout
	
	print("Starting to animate labels")
	await animate_labels()

func animate_labels():
	if current_label_index < labels.size():
		var label = labels[current_label_index]
		var full_text = labels_full[current_label_index]
		
		print("Animating label", current_label_index + 1)
		print("Full text of label before animation:", full_text)
		
		label.text = ""  # Clear text before animation
		print("Label content after clearing for animation:", label.text)

		# Animate text letter by letter
		for i in range(full_text.length()):
			label.text += full_text[i]
			print("Label content during animation:", label.text)
			await get_tree().create_timer(letter_delay).timeout
		
		current_label_index += 1
		
		print("Finished animating label", current_label_index)
		
		await get_tree().create_timer(letter_delay).timeout
		await animate_labels()
	else:
		change_scene()

func change_scene():
	print("Changing scene to:", next_level)
	await get_tree().create_timer(animation_delay).timeout
	get_tree().change_scene_to_file(next_level)

func num_secret_text():
	match GlobalVariables.secret_number:
		0:
			return "0... try again!"
		1:
			return "1! keep going!"
		2:
			return "2! so close!"
		3:
			return "all 3! great job!"
