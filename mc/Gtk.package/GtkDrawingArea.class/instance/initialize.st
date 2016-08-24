initialization
initialize
	super initialize.
	drawing := false.
	self 
		connect: 'draw' 
		signature: #( Boolean (void *widget, void *cr, void *data) ) 
		do: [ :widget :cr :data |
			"self doJustOnce: [ self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr) ]."
			false ]