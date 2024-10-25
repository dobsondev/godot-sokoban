extends Button
class_name LevelButton

# Note: these should max the suffix of the level (ie. `01` -> `level_01.tscn`)
@export var levelKey: String = "01"

# Need to use _ready() here instead of just ready() since we programmatically
# add these in `main_menu.gd`.
func _ready() -> void:
	self.pressed.connect(_on_level_button_pressed)

func add_crown_sprite() -> void:
	var crown_sprite = Sprite2D.new()
	var texture = load("res://assets/aseprite/crown.png") as Texture2D
	crown_sprite.texture = texture
	self.add_child(crown_sprite)

func _on_level_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_" + levelKey + ".tscn")
