tests
testNew
	| widget |
	
	widget := self widgetClass new.
	self assert: widget notNil.
	self assert: widget platformView notNil.
	self assert: widget platformView handle notNil.