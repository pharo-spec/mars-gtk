tests
testTitle 
	| widget |
	
	widget := self createWidget.
	widget title: 'Test Window'.
	self assert: widget title = 'Test Window' 