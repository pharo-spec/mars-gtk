accessing
messageString
	self message isNull ifTrue: [ ^ 'Unknown error.' ].
	^ self message readString