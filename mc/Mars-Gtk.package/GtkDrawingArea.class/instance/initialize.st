initialization
initialize
	super initialize.
	drawing := false.
	self 
		connect: 'draw' 
		signature: #( int (void *widget, void *cr, void *data) ) 
		do: [ :widget :cr :data |
			GtkApplication uniqueInstance suspendRunLoopWhile: [ 
				self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr).].
			0 ]