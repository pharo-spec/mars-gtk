private handler
setDefaultEventsHandler
	^ self ffiCall: #(void *setDefaultEventsHandler()) module: 'EventsHandlerPlugin'