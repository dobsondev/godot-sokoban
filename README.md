# Basic Sokoban

## Creating A New Level

To create a new level, we want to create a scene from our `level.tscn` file. To 
do this, select the following from the Godot menu:

`Scene` -> `New Inherited Scene...`

Then select `level.tscn` from the `res://levels/` directory.

This will setup a new level with the proper TileMap, Player, and container 
Nodes for Boxes and Goals that you need to create the level. It will also use 
the parent script which will handle the level logic for you. This will just save 
some time creating new levels as you have a template to follow.

Once the level is created, remember to do the following:

1. Update the Level Key on the Level Node to it's correct value (eg. `02`)
2. Add the same Level Key to the `Globals.LEVEL` array

TODO: There is probably a better way to automate these level keys but I don't
know what it is currently.

## Things Worth Nothing

## Autoloads

- **Globals** -> All global constants we want to re-use go in this file.

## Theme / Colour Scheme

See:
- https://paletton.com/#uid=7590u0kbJbd311MaOhViHawKa01
