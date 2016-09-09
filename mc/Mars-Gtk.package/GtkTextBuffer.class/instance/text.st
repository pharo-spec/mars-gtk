accessing
text
	| start end |
	self startIter: (start := ExternalAddress new).
	self endIter: (end := ExternalAddress new).
	^ self textStart: (start pointerAt: 1) end: (end pointerAt: 1) includeHiddenChars: false 
	