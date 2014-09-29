initialization
initialize
	super initialize.
	self handle: self createViewHandle.
	callbacks := Set new. "I have to keep callbacks alive"
	self registerEvents	