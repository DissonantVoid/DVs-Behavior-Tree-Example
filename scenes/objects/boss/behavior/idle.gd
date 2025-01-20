extends BTAction

func tick(delta : float):
	super(delta)
	
	_set_status(Status.running)
