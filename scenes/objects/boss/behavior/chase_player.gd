extends BTCompositeAttachment

const _move_in_speed : float = 240.0
const _move_out_speed : float = 300.0
const _min_distance : float = 180.0
const _max_distance : float = 200.0

func tick(delta : float):
	super(delta)
	
	var agent := behavior_tree.agent
	var player_pos : Vector2 = get_tree().current_scene.player.global_position
	var distance : float = agent.global_position.distance_to(player_pos)
	
	if distance >= _max_distance:
		var direction : Vector2 = (player_pos - agent.global_position).normalized()
		agent.velocity = direction * _move_in_speed
	elif distance <= _min_distance:
		var direction : Vector2 = (agent.global_position - player_pos).normalized()
		agent.velocity = direction * _move_out_speed
	else:
		agent.velocity = Vector2.ZERO
	
	agent.move_and_slide()
