initialization
initialize
	super initialize.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ handle := nil ]