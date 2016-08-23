initialization
initialize
	super initialize.
	self 
		connect: 'draw' 
		signature: #( Boolean (void *widget, void *cr, void *data) ) 
		do: [ :widget :cr :data | 
			self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr).
			true ]