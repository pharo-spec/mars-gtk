running
stop 
	running := false.
	"runLoop terminate."
	(oldRunLoop notNil and: [ oldRunLoop isNull not ])
		ifTrue: [ self setEventsHandler: oldRunLoop ]
		ifFalse: [ self setDefaultEventsHandler ].
	runLoop := nil.
