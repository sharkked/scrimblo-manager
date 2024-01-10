class_name Critter
extends CharacterBody2D

var nickname = ""

@onready
var animations = $Animations
@onready
var state_machine = $StateMachine
@onready
var move_component = $MoveComponent

@onready
var falling_state = $StateMachine/Falling

func _ready():
	$Control/Label.text = nickname
	move_component.parent = self
	state_machine.init(self, animations, move_component)

func _physics_process(delta):
	state_machine.process_physics(delta)
	move_and_slide()

func use_gadget(gadget):
	global_position = gadget.global_position
	velocity = gadget.get_launch_velocity()
	state_machine.change_state(falling_state)
	move_component.direction = gadget.direction

func exit():
	queue_free()
