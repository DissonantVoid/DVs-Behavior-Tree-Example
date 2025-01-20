extends BTAction

const _shots_count : int = 12

func tick(delta : float):
	super(delta)
	
	for i : int in _shots_count:
		var angle : float = float(i)/_shots_count * TAU
		behavior_tree.agent.shoot(Vector2.RIGHT.rotated(angle))
	
	_set_status(Status.success)
