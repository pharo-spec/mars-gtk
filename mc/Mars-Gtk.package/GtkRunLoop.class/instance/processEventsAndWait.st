private
processEventsAndWait
	[ self gtkEventsPending ]
		whileTrue: [ self gtkMainIterationDo: false ].
	delay wait.