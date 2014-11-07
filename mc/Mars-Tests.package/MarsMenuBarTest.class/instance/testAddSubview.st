tests
testAddSubview
	| menuBar menu |
	
	menuBar := MarsMenuBar new. 
	menu := MarsMenuItem label: 'Test'.
	menuBar addSubview: menu.
	
	self assert: (menuBar subviews includes: menu)