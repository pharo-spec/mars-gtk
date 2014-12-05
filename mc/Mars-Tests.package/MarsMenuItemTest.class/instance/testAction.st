tests
testAction
	| menuItem |
	
	menuItem := MarsMenuItem new.
	menuItem action: [ true ].
	self assert: menuItem action value.