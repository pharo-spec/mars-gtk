private building
buildLabelFor: anObject 
	^ (GtkLabel newLabel: (self toString: anObject))
		data: anObject;
		yourself