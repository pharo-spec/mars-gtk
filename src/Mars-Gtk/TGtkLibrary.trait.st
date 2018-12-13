Trait {
	#name : #TGtkLibrary,
	#category : 'Mars-Gtk-Base'
}

{ #category : #'library path' }
TGtkLibrary classSide >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #accessing }
TGtkLibrary >> calloutAPIClass [

	^ TFCalloutAPI
]

{ #category : #'library path' }
TGtkLibrary >> ffiLibraryName [

	^ GtkLibrary
]
