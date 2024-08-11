extends Node2D

#Determines if music is playing or not
var is_playing = true

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.power_up_number = 2
	GlobalVariables.music = load("res://assets/sounds/music/Arpeggiator.wav")
	$AudioStreamPlayer2D.stream = GlobalVariables.music
	$AudioStreamPlayer2D.play(GlobalVariables.music_progress)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Controls music behavior - updates GlobalVariables Autoload with current 
# playback position, updateable on death
func _process(_delta):
	if is_playing:
		GlobalVariables.music_progress = $AudioStreamPlayer2D.get_playback_position()
	else:
		GlobalVariables.music_progress = 0.0
		$AudioStreamPlayer2D.play(GlobalVariables.music_progress)
		is_playing = true

# Handler in the event there is no music playing
func _on_audio_stream_player_2d_finished():
	is_playing = false
