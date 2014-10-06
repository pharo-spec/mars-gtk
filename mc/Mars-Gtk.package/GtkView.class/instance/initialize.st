initialization
initialize
	super initialize.
	self initializeHandle.
	callbacks := Set new. "I have to keep callbacks alive"
	self registerEvents	