tests
testLabel 
	| menuItem |
	
	menuItem := MarsMenuSubmenu new.
	menuItem label: 'Test'.
	self assert: menuItem label equals: 'Test'