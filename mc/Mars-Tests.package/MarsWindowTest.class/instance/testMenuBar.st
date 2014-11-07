tests
testMenuBar
	| window |
	
	window := MarsWindow new. 
	window menuBar: MarsMenuBar new.
	self assert: window menuBar notNil	
