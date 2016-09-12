accessing
string: aString 
	^ super string: (aString ifNil: [ '' ])