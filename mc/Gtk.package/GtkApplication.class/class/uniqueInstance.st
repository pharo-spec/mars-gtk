class initialization
uniqueInstance 
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]