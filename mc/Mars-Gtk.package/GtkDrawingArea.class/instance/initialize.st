initialization
initialize
	super initialize.
	drawing := false.
	self 
		connect: 'draw' 
		signature: #( int (void *widget, void *cr, void *data) ) 
		do: [ :widget :cr :data |
			"I need to be sure this process will not be highjacked by another 
			 so I need to execute it unpreemptively (otherwise it will crash 
			 the vm)"
			[ self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr) ] valueUnpreemptively.
			0 ]