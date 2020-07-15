Class {
	#name : #FcLibrary,
	#superclass : #FFILibrary,
	#category : #'Mars-Pango-FontConfig'
}

{ #category : #accessing }
FcLibrary class >> fcInit [

	^ self uniqueInstance fcInit
]

{ #category : #converting }
FcLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #accessing }
FcLibrary >> fcInit [

	^ self ffiCall: #(FcBool FcInit())
]

{ #category : #'accessing platform' }
FcLibrary >> macLibraryName [

	GtkLibrary isDebug ifTrue: [ '/Users/gtk3/gtk/inst/lib/libfontconfig.dylib' ].
	^ '/usr/local/lib/libfontconfig.dylib'
]

{ #category : #converting }
FcLibrary >> runner [
	
	^ GtkLibrary naturalRunner
]

{ #category : #'accessing platform' }
FcLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'libfontconfig.so.1'
]
