accessing
text
	| start end |
	self startIter: (start := ExternalAddress newPointer) autoRelease.
	self endIter: (end := ExternalAddress newPointer) autoRelease.
	^ self textStart: start end: end includeHiddenChars: false 
	