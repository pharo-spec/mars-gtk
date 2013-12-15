displaying
displayIfNeeded
	self needsDisplay ifFalse: [ ^ self ]. 

	self flag: #todo. "Display here".
	needsDisplay := false.