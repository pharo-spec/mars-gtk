as yet unclassified
initialize
	super initialize.
	drawCallback := FFICallback 
		signature: #( Boolean (void *widget, void *cr, void *data) ) 
		block: [ :widget :cr :data |
			self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr).
			true ]