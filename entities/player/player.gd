extends Area2D
class_name Player

signal move_made

@onready var ray_cast: RayCast2D = $RayCast2D

func _ready():
	position = Utilities.snap_to_grid(position)

func _unhandled_input(event):
	for direction in Globals.INPUTS.keys():
		if event.is_action_pressed(direction):
			check_move(direction)

func check_move(direction):
	ray_cast.target_position = Globals.INPUTS[direction] * Globals.GRID_SIZE
	ray_cast.force_raycast_update()
	if not ray_cast.is_colliding():
		move(direction)
	else:
		var collider = ray_cast.get_collider()
		if collider.is_in_group('box') and collider.move(direction):
			move(direction)

func move(direction):
	position += Globals.INPUTS[direction] * Globals.GRID_SIZE
	emit_signal("move_made")
