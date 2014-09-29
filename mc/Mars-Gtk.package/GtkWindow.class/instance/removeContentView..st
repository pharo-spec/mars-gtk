private
removeContentView: aPlatformView
	self gtkContainer: self handle remove: aPlatformView handle.
	^ aPlatformView