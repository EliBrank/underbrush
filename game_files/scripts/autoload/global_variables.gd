extends Node

# Sets power up level, updated in power_up.gd and level_*.gd
var power_up_number = 0

# sets up secrets (books) to be collected
var secret_number = 0

var collected_secrets = {
	"Level_1": false,
	"Level_2": false,
	"Level_3": false
}

# Sets the music, plays Smoke_and_twilight by default, updated by level_*.gd
var music = load("res://assets/sounds/music/Smoke_and_twilight_v1.wav")

# Updated every frame, reset on song end
var music_progress = 0.0
