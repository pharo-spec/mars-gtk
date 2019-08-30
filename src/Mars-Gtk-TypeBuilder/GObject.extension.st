Extension { #name : #GObject }

{ #category : #'*Mars-Gtk-TypeBuilder' }
GObject class >> gSubclass: aName [

	^ GClassBuilder build: [ :builder |
		builder 
			name: aName;
			parent: self ]
]
