private installing
installRunLoop
	semaIndex := Smalltalk registerExternalObject: inputSemaphore.
	self primEnableGtk3EventHandler: semaIndex.
	[
		[ inputSemaphore wait; consumeAllSignals. session == Smalltalk session ] 
		whileTrue: [ self processEvents ]
	] ensure:  [ Smalltalk unregisterExternalObject: inputSemaphore ]