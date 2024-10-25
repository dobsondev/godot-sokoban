extends Control

@onready var quit_button: Button = $CenterContainer/QuitButton
@onready var level_buttons_container: GridContainer = $LevelButtons/LevelButtonsContainer

func _ready() -> void:
	quit_button.pressed.connect(quit_button_pressed)
	# Load all our level buttons programmatically from the Globals
	for key in Globals.levels:
		var level_button = LevelButton.new()
		level_button.levelKey = Globals.levels[key]["level_key"]
		level_button.text = Globals.levels[key]["button_text"]
		level_buttons_container.add_child(level_button)
		
	for level_button in level_buttons_container.get_children():
		var key: String = level_button.levelKey
		if GameManager.is_level_beat(key):
			level_button.add_crown_sprite()

func quit_button_pressed():
	get_tree().quit()
