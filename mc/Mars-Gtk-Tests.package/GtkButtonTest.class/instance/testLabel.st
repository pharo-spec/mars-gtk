tests
testLabel
	| widget |
	
	widget := self createWidget.
	widget label: 'Test'.
	self assert: widget label equals: 'Test'