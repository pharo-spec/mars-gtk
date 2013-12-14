initialization
initialize 
	super initialize.
	running := false.
	delay := Delay forMilliseconds: self millisecondsToWait.
	