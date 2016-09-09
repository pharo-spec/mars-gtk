initialization
initialize
	super initialize.
	"I need to ensure the handle is null when destroy, to prevent double free"
	self connectDestroy: [ handle beNull ]