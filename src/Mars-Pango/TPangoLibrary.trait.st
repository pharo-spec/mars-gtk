"
I add access to Pango library.
"
Trait {
	#name : #TPangoLibrary,
	#category : #'Mars-Pango-Base'
}

{ #category : #'library path' }
TPangoLibrary classSide >> ffiLibraryName [
	^ PangoLibrary
]

{ #category : #'library path' }
TPangoLibrary >> ffiLibraryName [
	^ self class ffiLibraryName
]
