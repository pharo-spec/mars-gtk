displaying
displayIfNeeded 
	super displayIfNeeded.
	self view subviewsDo: [ :each | each displayIfNeeded ].