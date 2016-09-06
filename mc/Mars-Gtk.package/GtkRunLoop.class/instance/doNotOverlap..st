private
doNotOverlap: aBlock
	executing ifTrue: [ ^ self ].
	executing := true.
	aBlock ensure: [ executing := false ]
