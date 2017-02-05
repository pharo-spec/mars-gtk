instance creation
uniqueInstance
	self = GtkRunLoop 
		ifTrue: [ self error: 'I''m an abstract class. Use #uniqueInstance' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]