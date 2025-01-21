extends BTAction

func enter():
	super()
	
	behavior_tree.agent.modulate = Color.BLACK

func tick(delta : float):
	super(delta)
	
	_set_status(Status.running)
