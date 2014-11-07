tests
testLabel 
	| menuItem |
	
	menuItem := MarsMenuItem new.
	menuItem label: 'Test'.
	self assert: menuItem label equals: 'Test'