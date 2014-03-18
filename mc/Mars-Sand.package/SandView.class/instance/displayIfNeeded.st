displaying
displayIfNeeded
	self isVisible ifFalse: [ ^ self ].
	self needsDisplay ifFalse: [ ^ self ]. 

	self flag: #todo. "Display here".
	needsDisplay := false.