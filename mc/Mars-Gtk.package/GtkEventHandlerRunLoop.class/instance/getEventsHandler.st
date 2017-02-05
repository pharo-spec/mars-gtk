private handler
getEventsHandler
	^ self ffiCall: #(void *getEventsHandler(void)) module: 'EventsHandlerPlugin'