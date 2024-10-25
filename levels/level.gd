extends Node2D
class_name Level

signal level_completed(nextLevel: PackedScene)

@export var level_key: String = "01"
@export var next_level: PackedScene

@onready var player: Area2D = $Player
@onready var level_cleared_ui: MarginContainer = $LevelCleared
@onready var moves_made_text_label: RichTextLabel = $LevelCleared/ColorRect/MovesMade
@onready var next_level_text_label: RichTextLabel = $LevelCleared/ColorRect/NextLevel

var level_end: bool = false
var moves_made: int = 0

func _ready() -> void:
	player.move_made.connect(update_moves_made)
	level_cleared_ui.hide()
	next_level_text_label.hide()

func _process(_delta: float) -> void:
	if not level_end:
		var goals = $Goals.get_children()
		if goals:
			var all_goals_occupied: bool = true
			for goal: Goal in goals:
				if not goal.occupied:
					all_goals_occupied = false
					break
			if all_goals_occupied:
				level_end = true
				GameManager.beat_level(level_key, moves_made)
				moves_made_text_label.text = "Moves Made: " + str(moves_made)
				level_cleared_ui.show()
				if next_level != null:
					next_level_text_label.show()

func _unhandled_input(event):
	if event.is_action_pressed("reset_level"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://ui/main_menu/main_menu.tscn")
	if event.is_action_pressed("interact") and level_end and next_level != null:
		get_tree().change_scene_to_packed(next_level)

func update_moves_made():
	moves_made += 1
