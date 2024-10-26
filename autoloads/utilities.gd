extends Node

func snap_to_grid(pos: Vector2) -> Vector2:
	return Vector2(
		round(pos.x / Globals.GRID_SIZE) * Globals.GRID_SIZE,
		round(pos.y / Globals.GRID_SIZE) * Globals.GRID_SIZE
	)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
