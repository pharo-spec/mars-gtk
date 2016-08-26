initialization
initialize 
	super initialize.
	running := false.
	suspended := false.
	delay := Delay forMilliseconds: self millisecondsToWait	.

	extraIdleProcess := [ ProcessorScheduler idleProcess ] newProcess
		priority: Processor lowestPriority;
		name: 'Extra idle processor (callback support)';
		resume.