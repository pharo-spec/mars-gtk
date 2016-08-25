private
doJustOnce: aBlock
	"I ensure no draw can happen if I'm already drawing"
	drawing ifTrue: [ ^ self ].
	drawing := true.
	aBlock ensure: [ drawing := false ]