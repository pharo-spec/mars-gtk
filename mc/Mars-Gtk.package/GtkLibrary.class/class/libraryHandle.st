accessing
libraryHandle
	(NativeBoost sessionChanged: session) ifTrue: [
		handle := self loadGtkLibrary.
		session := NativeBoost uniqueSessionObject ].

	^ handle
	