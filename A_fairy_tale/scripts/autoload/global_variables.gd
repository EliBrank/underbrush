extends Node

# Sets power up level, updated in power_up.gd and level_*.gd
var power_up_number = 0

# Sets the music, plays Smoke_and_twilight by default, updated by level_*.gd
var music = load("res://assets/sounds/music/Smoke_and_twilight_v1.wav")

# Updated every frame, reset on song end
var music_progress = 0.0


var current_level: String = "level_1"

# dictionary containing each tilemap
var tilemap_paths = {
	"level_1": "res://assets/sprites/TileMap-Sheet_Forest.png",
	"level_2": "res://assets/sprites/TileMap-Sheet_Grape.png",
	"level_3": "res://assets/sprites/TileMap-Sheet_RoseChocolate.png"
}

var default_tilemap = "res://assets/sprites/TileMap-Sheet.png"

# get texture based on current level
func get_current_tileset() -> Texture:
	return load(tilemap_paths.get(current_level, default_tilemap))
