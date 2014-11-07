accessing
menuBar: aMenubar
	self view menuBar 
		ifNotNil: [ :menubarView | menubarView removeFromSuperview ].
	self gtkContainer: self handle add: aMenubar handle.
	^ aMenubar