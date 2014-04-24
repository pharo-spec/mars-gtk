displaying
displayIfNeeded
	self application 
		windowsDo: [ :each | each platformView displayIfNeeded ]