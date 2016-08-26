as yet unclassified
suspendRunLoopWhile: aBlock
	self stop.
	^ aBlock ensure: [ self start ]