extends BTAction

func tick(delta : float):
	super(delta)
	
	var player : Player = get_tree().current_scene.player
	var player_perdicted_pos : Vector2 = player.global_position + player.velocity/2.0
	var direction : Vector2 = (player_perdicted_pos - behavior_tree.agent.global_position).normalized()
	behavior_tree.agent.shoot(direction)
	_set_status(Status.success)
