instance creation
label: aString icon: aForm action: aBlock
	^ self new 
		label: aString;
		icon: aForm;
		action: aBlock;
		yourself