Extension { #name : #Form }

{ #category : #'*Mars-Gtk-Morphic' }
Form >> asGdkPixbuf [
	^ GdkPixbuf newForm: self
]
