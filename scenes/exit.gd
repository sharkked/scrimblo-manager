extends Node2D

func _on_critter_entered(critter):
	if critter is Critter:
		critter.exit()
