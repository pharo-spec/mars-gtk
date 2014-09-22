tests
testNew
	| widget |
	
	widget := self createWidget.
	self assert: widget notNil.
	self assert: widget notNil.
	self assert: widget handle notNil.