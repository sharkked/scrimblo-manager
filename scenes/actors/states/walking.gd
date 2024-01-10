extends State

@export
var fall_state: State

func process_physics(delta: float) -> State:
	if !parent.is_on_floor():
		return fall_state
	var direction = get_movement_input()
	parent.velocity.x = direction * move_speed
	animations.flip_h = direction < 0
	return null
