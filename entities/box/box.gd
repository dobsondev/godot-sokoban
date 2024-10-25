extends StaticBody2D
class_name Box
# Note: We make this a StaticBody2D even though it is not static so that our
# RayCast2D from the player script will detect collisions with it without extra
# configuration.

@export var box_type: Globals.GoalType = Globals.GoalType.GREEN

@onready var green_sprite: Sprite2D = $GreenSprite
@onready var red_sprite: Sprite2D = $RedSprite
@onready var ray_cast: RayCast2D = $RayCast2D

func _ready():
	if self.box_type != Globals.GoalType.GREEN:
		green_sprite.hide()
		red_sprite.show()
	position = Utilities.snap_to_grid(position)

func move(direction):
	ray_cast.target_position = Globals.inputs[direction] * Globals.GRID_SIZE
	ray_cast.force_raycast_update()
	if not ray_cast.is_colliding():
		position += Globals.inputs[direction] * Globals.GRID_SIZE
		return true
	return false
