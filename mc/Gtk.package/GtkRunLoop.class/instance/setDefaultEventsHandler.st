private handler
setDefaultEventsHandler
	^ self ffiCall: #(void *setDefaultEventsHandler(void)) module: 'EventsHandlerPlugin'