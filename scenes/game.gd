extends Node2D

var critters = {}

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
