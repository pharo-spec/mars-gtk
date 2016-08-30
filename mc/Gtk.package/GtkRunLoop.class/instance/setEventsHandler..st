private handler
setEventsHandler: aHandler
	^ self ffiCall: #(void setEventsHandler(void *aHandler)) module: 'EventsHandler'