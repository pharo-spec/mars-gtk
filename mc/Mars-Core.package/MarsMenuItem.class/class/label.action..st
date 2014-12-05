instance creation
label: aString action: aBlock 
	^ (self label: aString)
		action: aBlock;
		yourself