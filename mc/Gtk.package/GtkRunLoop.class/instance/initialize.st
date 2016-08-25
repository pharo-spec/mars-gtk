initialization
initialize 
	super initialize.
	running := false.
	suspended := false.
	delay := Delay forMilliseconds: self millisecondsToWait	.
	runLoop := [ self runLoop ] newProcess
		priority: Processor userSchedulingPriority;
		name: 'Gtk run loop';
		yourself.
	extraIdleProcess := [ ProcessorScheduler idleProcess ] newProcess
		priority: Processor userSchedulingPriority;
		name: 'Extra idle processor (callback support)';
		yourself.