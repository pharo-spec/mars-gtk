Extension { #name : #AthensCairoCanvas }

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas class >> fromHandle: aHandle [
	^ self basicNew 
		fromHandle: aHandle
]

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas >> fromHandle: aHandle [
	
	handle := aHandle.
	"#getTarget will create a surface, but it will not initialize it, so we do it"
	surface := self getTarget fromCanvas: self. 
	pathTransform := self matrix.
	paintTransform := pathTransform copy.
	paintMode := AthensCairoPaintMode new canvas: self.
	
	self setAA: CAIRO_ANTIALIAS_SUBPIXEL.	
	self initializeWithSurface: surface
]

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas >> getMatrix: matrix [

	^ self ffiCall: #(void cairo_get_matrix (self, AthensCairoMatrix *matrix))
]

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas >> getTarget [
	"Answer the surface for this canvas. 
	 NOT INITIALISED in image (it just sets the handle)"

	^ self ffiCall: #(cairo_surface_t *cairo_get_target (self))
]

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas >> matrix [ 
	| matrix |
	
	matrix := AthensCairoMatrix new.
	self getMatrix: matrix.
	^ matrix
]
