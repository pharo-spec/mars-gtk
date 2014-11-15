accessing
addContentView: aPlatformView
	self contentLayout 
		gtkBox: self contentHandle 
		packStart: aPlatformView handle
		expand: true
		fill: true
		padding: 0.
	^ aPlatformView