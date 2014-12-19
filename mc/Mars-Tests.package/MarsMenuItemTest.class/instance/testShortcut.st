tests
testShortcut
	| menuItem |
	
	menuItem := MarsMenuItem new.
	menuItem label: 'Test'.
	menuItem shortcut: $c command.
	self assert: menuItem shortcut equals: $c command