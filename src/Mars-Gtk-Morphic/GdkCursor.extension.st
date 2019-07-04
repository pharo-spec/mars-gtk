Extension { #name : #GdkCursor }

{ #category : #'*Mars-Gtk-Morphic' }
GdkCursor class >> fromForm: aForm [
	| cursorSurface |
	
	cursorSurface := GtkCairoSurface fromForm: aForm.
	^ self newFromSurface: cursorSurface
]
