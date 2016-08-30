accessing
loadFromPath: path
	| encodedPath error |
	
	error  := GError externalNew autoRelease.
	encodedPath := self class fileNameToUTF8: path.
	(self loadFromPath: encodedPath error: error getHandle) 
		ifFalse: [ ^ GtkError signal: error messageString ].
	 