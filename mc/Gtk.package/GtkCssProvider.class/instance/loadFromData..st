accessing
loadFromData: aString
	| error |
	error := GError externalNew autoRelease.
	(self loadFromData: aString length: aString size error: 0)
		ifFalse: [ ^ GtkError signal ].
	 