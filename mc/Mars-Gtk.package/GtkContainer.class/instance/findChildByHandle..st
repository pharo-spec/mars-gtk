private
findChildByHandle: anExternalAddress
	| address |
	address := anExternalAddress asInteger.
	^ children detect: [ :each | each getHandle asInteger = address ]