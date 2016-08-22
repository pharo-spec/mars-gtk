private
getEventsPending
	^ self ffiCall: #( Boolean gtk_events_pending ( void ) )