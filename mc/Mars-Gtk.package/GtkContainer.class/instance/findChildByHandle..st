private
findChildByHandle: anExternalAddress
	| address |
	anExternalAddress ifNil: [ ^ nil ].
	address := anExternalAddress asInteger.
	^ children detect: [ :each | each getHandle asInteger = address ]