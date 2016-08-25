initialization
initialize 
	super initialize.
	running := false.
	suspended := false.
	delay := Delay forMilliseconds: self millisecondsToWait	.
	runLoop := [ self runLoop ] newProcess.
	extraIdleProcess := [ ProcessorScheduler idleProcess ] newProcess.