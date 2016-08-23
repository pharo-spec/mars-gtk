initialization
initialize
	super initialize.
	self 
		connect: 'Draw' 
		signature: #( Boolean (void *widget, void *cr, void *data) ) 
		do: [ :widget :cr :data | 
			self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr).
			true ]