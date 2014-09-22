tests
testText
	| widget |
	
	widget := self createWidget.
	widget text: 'Test'.
	self assert: widget text equals: 'Test'