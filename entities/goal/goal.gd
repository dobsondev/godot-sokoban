extends Area2D
class_name Goal

@export var goal_type: Globals.GOAL_TYPE = Globals.GOAL_TYPE.GREEN

@onready var green_sprite: Sprite2D = $GreenSprite
@onready var red_sprite: Sprite2D = $RedSprite
@onready var green_goal_sound: AudioStreamPlayer = $GreenGoalSound
@onready var red_goal_sound: AudioStreamPlayer = $RedGoalSound

var occupied: bool = false

func _ready() -> void:
	if self.goal_type != Globals.GOAL_TYPE.GREEN:
		green_sprite.hide()
		red_sprite.show()
	area_entered.connect(self._on_area_entered)
	area_exited.connect(self._on_area_exited)

func _on_area_entered(area: Area2D):
	var box = area.get_parent()
	if box is Box and box.is_in_group('box') and box.box_type == self.goal_type:
		if self.goal_type == Globals.GOAL_TYPE.GREEN:
			green_goal_sound.play()
		else:
			red_goal_sound.play()
		occupied = true

func _on_area_exited(area: Area2D):
	var box = area.get_parent()
	if box and box.is_in_group('box'):
		occupied = false
