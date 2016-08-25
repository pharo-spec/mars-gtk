as yet unclassified
suspendLoopWhile: aBlock
	runLoop suspend.	 
	aBlock ensure: [ runLoop resume ]