private
getEventsPending
	^ self ffiCall: #( gboolean gtk_events_pending ( void ) )