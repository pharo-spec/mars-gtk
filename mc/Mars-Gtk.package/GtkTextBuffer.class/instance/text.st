accessing
text
	| start end |
	self startIter: (start := ExternalAddress new).
	self endIter: (end := ExternalAddress new).
	^ self textStart: start end: end includeHiddenChars: false 
	