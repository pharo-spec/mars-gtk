Trait {
	#name : #TGtkLibrary,
	#category : 'Mars-Gtk-Base'
}

{ #category : #'library path' }
TGtkLibrary classSide >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #'library path' }
TGtkLibrary >> ffiLibraryName [
	^ self class ffiLibraryName
]
