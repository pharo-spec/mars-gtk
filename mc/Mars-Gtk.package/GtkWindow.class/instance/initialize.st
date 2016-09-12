initialization
initialize
	super initialize.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ 
		GtkDestroySignal emitWidget: self.
		handle := nil ]