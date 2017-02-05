private installing
installRunLoop
	semaIndex := Smalltalk registerExternalObject: inputSemaphore.
	self primEnableGtk3EventHandler: semaIndex.
	[
		[ inputSemaphore wait; consumeAllSignals. session == Smalltalk session ] 
		whileTrue: [ 
			Stdio stdout << 'Processing >>'; cr; lf.
			self processEvents.
			World doOneCycle.
			Stdio stdout << 'Processing <<'; cr; lf ]
	] ensure:  [ Smalltalk unregisterExternalObject: inputSemaphore ]