tests
testShow
	| window |
	
	window := MarsWindow new. 
	self deny: window isVisible.
	window show.
	self assert: window isVisible.	
