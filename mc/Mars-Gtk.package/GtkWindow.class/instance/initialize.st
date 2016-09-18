initialization
initialize
	super initialize.
	"I retain a reference to ensure it is not destroyed until I actually want to doit"
	"self objectReference."
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ 
		GtkDestroySignal emitWidget: self.
		handle := nil ]