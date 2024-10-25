extends StaticBody2D

func _ready():
	position = Utilities.snap_to_grid(position)
