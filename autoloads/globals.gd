extends Node

const GRID_SIZE = 16

const inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

enum GoalType {
	GREEN,
	RED
}

const levels = {
	"01": { "level_key": "01", "button_text": "One" },
	"02": { "level_key": "02", "button_text": "Two" },
}
