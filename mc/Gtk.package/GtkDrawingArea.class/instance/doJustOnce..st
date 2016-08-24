private
doJustOnce: aBlock
	drawing ifTrue: [ ^ self ].
	drawing := true.
	aBlock ensure: [ drawing := false ]