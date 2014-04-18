accessing
reset 
	Current ifNil: [ ^ self ].
	Current stop.
	Current := nil.