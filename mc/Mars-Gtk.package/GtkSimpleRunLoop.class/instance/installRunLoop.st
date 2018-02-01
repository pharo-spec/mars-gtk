private installing
installRunLoop
	[
		[ self isRunning and: [ session == Smalltalk session ] ] 
		whileTrue: [
			self processEvents.
			(Delay forMilliseconds: 5) wait ] ]
		forkAt: Processor highIOPriority 
		named: 'GtkRunLoop'