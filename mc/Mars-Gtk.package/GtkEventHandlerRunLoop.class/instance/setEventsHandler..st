private handler
setEventsHandler: aHandler
	^ self ffiCall: #(void setEventsHandler(FFICallback aHandler)) module: 'EventsHandlerPlugin'