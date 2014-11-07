tests
testLabel 
	| menuItem |
	
	menuItem := MarsMenu new.
	menuItem label: 'Test'.
	self assert: menuItem label equals: 'Test'