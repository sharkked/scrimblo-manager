extends Node2D

@export
var direction = +1
@export
var launch_speed = Vector2(200, -350)

func _on_critter_entered(critter):
	if critter is Critter and critter.is_on_floor():
		critter.use_gadget(self)

func get_launch_velocity() -> Vector2:
	return Vector2(direction * launch_speed.x, launch_speed.y)
