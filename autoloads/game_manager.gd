extends Node

var levels_status: Dictionary

# Need to use _ready() rather than just ready() for autoloads
func _ready() -> void:
	for key in Globals.levels:
		levels_status[key] = { "beat": false, "moves": 0 }

func beat_level(levelKey: String, moves: int):
	levels_status[levelKey] = { "beat": true, "moves": moves }

func check_level_status(levelKey) -> Dictionary:
	return levels_status[levelKey] as Dictionary

func is_level_beat(levelKey) -> bool:
	return levels_status[levelKey]["beat"] as bool
