instance creation
platformViewClass: aViewClass
	^ self basicNew 
		initializePlatformViewClass: aViewClass;
		yourself