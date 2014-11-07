tests
testTitle
	| window |
	
	window := MarsWindow new. 
	window title: 'Test'.
	self assert: window title = 'Test'.	
	