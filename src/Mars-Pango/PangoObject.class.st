Class {
	#name : #PangoObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#category : #'Mars-Pango-Base'
}

{ #category : #'library path' }
PangoObject class >> ffiLibraryName [
	^ PangoLibrary
]
