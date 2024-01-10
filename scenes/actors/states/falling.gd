extends State

@export
var walk_state: State

func exit() -> void:
	animations.rotation = 0

func process_physics(delta: float) -> State:
	if parent.is_on_floor():
		return walk_state
	
	animations.rotation_degrees += get_movement_input() * 360 * delta
	parent.velocity.y += gravity * delta
	return null
