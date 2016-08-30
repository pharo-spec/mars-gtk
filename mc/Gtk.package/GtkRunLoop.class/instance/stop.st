running
stop 
	running := false.
	"runLoop terminate."
	self setDefaultEventsHandler.
	runLoop := nil.
