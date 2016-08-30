private handler
getEventsHandler
	^ self ffiCall: #(void *getEventsHandler()) module: 'EventsHandlerPlugin'