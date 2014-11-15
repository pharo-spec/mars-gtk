tests
testSubmenu
	| menuItem |
	
	menuItem := MarsMenuSubmenu new.
	menuItem submenu: (MarsMenu new 
		add: (MarsMenuItem label: 'Test 1');
		add: (MarsMenuItem label: 'Test 2');
		yourself).
		
	self assert: menuItem submenu notNil.
	self assert: menuItem submenu items size = 2. 
	self assert: menuItem submenu items first label = 'Test 1'