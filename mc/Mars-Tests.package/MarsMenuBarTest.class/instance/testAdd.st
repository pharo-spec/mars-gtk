tests
testAdd
	| menuBar menu |
	
	menuBar := MarsMenuBar new. 
	menu := MarsMenuItem label: 'Test'.
	menuBar add: menu.
	
	self assert: (menuBar items includes: menu)