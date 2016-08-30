instance creation
loadFromPath: path
	| address error encodedPath |
	
	address := ExternalAddress new.
	error  := GError externalNew autoRelease.
	encodedPath := self fileNameToUTF8: path.
	(self loadFromPath: address path: encodedPath error: error)
		ifFalse: [ GtkError signal: error messageString ].
	^ self fromHandle: address