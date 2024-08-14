extends Control

# 0 will be "start", 1 will be "quit"
var current_selection: int = 0

@export var start_position: Vector2
@export var quit_position: Vector2

@onready var cursor_sprite = $AnimatedCursor
@onready var sound_select = $Select

# Called when the node enters the scene tree for the first time.
func _ready():
	update_cursor_position()
	
	# initialize secret number to 0 when starting from menu
	GlobalVariables.secret_number = 0
	
	for collected_status in GlobalVariables.collected_secrets:
		GlobalVariables.collected_secrets[collected_status] = false
		
	print(GlobalVariables.collected_secrets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		if current_selection == 0:
			current_selection = 1
		else:
			current_selection = 0
		update_cursor_position()
		sound_select.play()
	elif Input.is_action_just_pressed("ui_accept"):
		select_option()

func update_cursor_position():
	if current_selection == 0:
		cursor_sprite.position = start_position
	elif current_selection == 1:
		cursor_sprite.position = quit_position
		
func select_option():
	if current_selection == 0:
		get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	elif current_selection == 1:
		get_tree().quit()
