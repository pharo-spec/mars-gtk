tests
testRemoveSubview
	| panel widget |
	
	panel := self createWidget.
	widget := GtkButton view: nil.
	panel addSubview: widget.
	self assert: (self collectSubviewHandles: panel) anyOne = widget handle.
	panel removeSubview: widget.
	self assert: (self collectSubviewHandles: panel) isEmpty