extends BTCondition

const _detect_distance : float = 250.0

func tick(delta ):
	super(delta)
	
	var agent := behavior_tree.agent
	var player_pos : Vector2 = get_tree().current_scene.player.global_position
	var distance : float = agent.global_position.distance_to(player_pos)
	
	if distance <= _detect_distance:
		_set_status(Status.success)
	else:
		_set_status(Status.failure)
