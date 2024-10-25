extends Area2D
class_name Goal

@export var goal_type: Globals.GoalType = Globals.GoalType.GREEN

@onready var green_sprite: Sprite2D = $GreenSprite
@onready var red_sprite: Sprite2D = $RedSprite

var occupied: bool = false

func _ready() -> void:
	if self.goal_type != Globals.GoalType.GREEN:
		green_sprite.hide()
		red_sprite.show()
	area_entered.connect(self._on_area_entered)
	area_exited.connect(self._on_area_exited)

func _on_area_entered(area: Area2D):
	var box = area.get_parent()
	if box and box.is_in_group('box'):
		occupied = true

func _on_area_exited(area: Area2D):
	var box = area.get_parent()
	if box and box.is_in_group('box'):
		occupied = false
