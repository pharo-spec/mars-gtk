tests
testStart 
	| app |
	
	app := MarsApplication new. 
	self deny: app isRunning.
	[ 
		app start. 
		self assert: app isRunning ]
	ensure: [ app stop ].
	self deny: app isRunning.