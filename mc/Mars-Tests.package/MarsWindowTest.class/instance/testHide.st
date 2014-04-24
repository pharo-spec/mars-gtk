tests
testHide
	| window |
	
	window := MarsWindow new. 
	window show.
	self assert: window isVisible.	
	window hide. 
	self deny: window isVisible.