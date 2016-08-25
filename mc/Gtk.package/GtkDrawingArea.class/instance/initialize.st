initialization
initialize
	super initialize.
	drawing := false.
	self 
		connect: 'draw' 
		signature: #( int (void *widget, void *cr, void *data) ) 
		do: [ :widget :cr :data |
			self doJustOnce: [ 
				self cairoSave: cr.
				self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr).
				self cairoRestore: cr ].
			0 ]