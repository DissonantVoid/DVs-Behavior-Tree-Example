extends BTAction

@onready var _attack_timer : Timer = $AttackTime
@onready var _time_between_shots : Timer = $TimeBetweenShots

const _shot_angle_increment : float = deg_to_rad(20)
var _shot_angle : float = 0.0

func enter():
	super()
	
	_shot_angle = 0.0
	_attack_timer.start()
	_time_between_shots.start()

func exit(is_interrupted : bool):
	super(is_interrupted)
	
	if is_interrupted:
		_attack_timer.stop()
	
	_time_between_shots.stop()

func tick(delta ):
	super(delta)
	
	if _attack_timer.is_stopped():
		_set_status(Status.success)
	else:
		_set_status(Status.running)

func _on_time_between_shots_timeout():
	_shot_angle += _shot_angle_increment
	behavior_tree.agent.shoot(Vector2.RIGHT.rotated(_shot_angle))
