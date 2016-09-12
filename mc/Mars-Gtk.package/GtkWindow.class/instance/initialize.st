initialization
initialize
	super initialize.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	finalizeMutex := Mutex new.
	self connectDestroy: [ 
		finalizeMutex critical: [  
			GtkDestroySignal emitWidget: self.
			handle := nil ] ]