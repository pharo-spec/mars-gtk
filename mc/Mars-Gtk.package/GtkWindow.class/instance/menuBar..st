accessing
menuBar: aMenuBar
	self view menuBar 
		ifNotNil: [ :menubarView | menubarView removeFromSuperview ].
	
	self contentLayout 
		gtkBox: self contentHandle 
		packStart: aMenuBar handle
		expand: false
		fill: false
		padding: 0.
			
	^ aMenuBar