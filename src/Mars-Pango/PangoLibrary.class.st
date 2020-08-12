"
I'm a library to add bindings with pango.
"
Class {
	#name : #PangoLibrary,
	#superclass : #FFILibrary,
	#category : #'Mars-Pango-Base'
}

{ #category : #accessing }
PangoLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'accessing platform' }
PangoLibrary >> macLibraryName [

	^ '/usr/local/lib/libpango-1.0.0.dylib'
]

{ #category : #accessing }
PangoLibrary >> runner [
	
	^ GtkLibrary naturalRunner
]

{ #category : #'accessing platform' }
PangoLibrary >> unix32LibraryName [ 

	^ '/usr/lib/i386-linux-gnu/libpango-1.0.so.0'
]

{ #category : #'accessing platform' }
PangoLibrary >> unix64LibraryName [ 

	^ FFIUnix64LibraryFinder findLibrary: 'libpango-1.0.so'
]

{ #category : #'accessing platform' }
PangoLibrary >> win32LibraryName [
	
	"this could be  libpangowin32-1.0-0.dll instead"
	^ 'libpango-1.0-0.dll'
]
