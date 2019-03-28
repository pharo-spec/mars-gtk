Extension { #name : #AthensCairoCanvas }

{ #category : #'*Mars-Pango' }
AthensCairoCanvas >> showLayout: layout [
	self 
		ffiCall: #(void pango_cairo_show_layout (self, PangoLayout *layout))
		module: PangoCairoLibrary
]

{ #category : #'*Mars-Pango' }
AthensCairoCanvas >> updateLayout: layout [
	self 
		ffiCall: #(void pango_cairo_update_layout (self, PangoLayout *layout))
		module: PangoCairoLibrary
]
