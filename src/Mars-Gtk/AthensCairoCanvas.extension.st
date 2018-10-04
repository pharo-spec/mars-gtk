Extension { #name : #AthensCairoCanvas }

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas >> fromHandle: aHandle [
	| target |
	handle := aHandle.
	"#getTarget will create a surface, but it will not initialize it, so we do it"
	target := (self getTarget) fromCanvas: self. 
	self surface: target.
	self initializeWithSurface: target
]

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas class >> fromHandle: aHandle [
	^ self basicNew 
		fromHandle: aHandle
]

{ #category : #'*Mars-Gtk' }
AthensCairoCanvas >> getTarget [
	^ self ffiCall: #( cairo_surface_t * cairo_get_target ( self ) )
]
