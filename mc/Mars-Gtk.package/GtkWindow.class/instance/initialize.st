initialization
initialize
	super initialize.
	callbacks := Set new. "I have to keep callbacks alive"
	self registerEvents