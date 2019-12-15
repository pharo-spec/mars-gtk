Extension { #name : #Form }

{ #category : #'*Mars-Gtk-Morphic' }
Form >> asAthensSurface [

	^ AthensCairoSurface fromForm: self
]

{ #category : #'*Mars-Gtk-Morphic' }
Form >> asGdkPixbuf [

	^ GdkPixbuf newForm: self
]

{ #category : #'*Mars-Gtk-Morphic' }
Form >> asGtkImage [

	^ GtkImage newPixbuf: self asGdkPixbuf 
]
