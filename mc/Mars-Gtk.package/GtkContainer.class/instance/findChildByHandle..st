private
findChildByHandle: anExternalAddress
	| address |
	(anExternalAddress isNil or: [ anExternalAddress isNull ]) ifTrue: [ ^ nil ].
	address := anExternalAddress asInteger.
	^ children detect: [ :each | each getHandle asInteger = address ]