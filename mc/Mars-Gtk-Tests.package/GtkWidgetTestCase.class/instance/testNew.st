tests
testNew
	| widget |
	
	widget := self widgetClass view: MarsPanel new.
	self assert: widget notNil.
	self assert: widget notNil.
	self assert: widget handle notNil.