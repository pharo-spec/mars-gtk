accessing
loadFromData: aString
	| error |
	error := GError externalNew autoRelease.
	error message: FFIExternalArray newPointer autoRelease.
	(self loadFromData: aString length: aString size error: error)
		ifFalse: [ ^ GtkError signal ].
	 