private
fileNameToUTF8: aString
	| encoded read written error |
	
	read := ExternalAddress new.
	written := ExternalAddress new.
	error := GError externalNew autoRelease.
	encoded := self 
		fileNameToUTF8: aString 
		len: aString size 
		read: read 
		written: written
		error: error.
		
	error isOk ifTrue: [ ^ GtkError signal: error messageString ].
	
	^ encoded