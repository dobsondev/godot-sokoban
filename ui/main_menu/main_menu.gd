extends Control

@onready var quit_button: Button = $CenterContainer/QuitButton
@onready var level_buttons_container: GridContainer = $LevelButtons/LevelButtonsContainer

func _ready() -> void:
	quit_button.pressed.connect(quit_button_pressed)
	# Load all our level buttons programmatically from the Globals
	for level in Globals.LEVELS:
		var level_button = LevelButton.new()
		level_button.levelKey = level
		level_button.text = level
		level_buttons_container.add_child(level_button)
		
	for level_button in level_buttons_container.get_children():
		var key: String = level_button.levelKey
		if GameManager.is_level_beat(key):
			level_button.add_crown_sprite()

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func quit_button_pressed():
	get_tree().quit()
