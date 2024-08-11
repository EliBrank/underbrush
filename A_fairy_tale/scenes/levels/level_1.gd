extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.power_up_number = 0
	GlobalVariables.music = load("res://assets/sounds/music/Smoke_and_twilight_v1.wav")
	$AudioStreamPlayer2D.stream = GlobalVariables.music
	$AudioStreamPlayer2D.play(GlobalVariables.music_progress)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	GlobalVariables.music_progress = $AudioStreamPlayer2D.get_playback_position()
