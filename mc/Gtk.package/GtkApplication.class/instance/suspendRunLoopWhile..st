as yet unclassified
suspendRunLoopWhile: aBlock
	runLoop suspend.	 
	aBlock ensure: [ runLoop resume ]