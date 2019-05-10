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
PangoLibrary >> macModuleName [

	^ '/usr/local/lib/libpango-1.0.0.dylib'
]

{ #category : #accessing }
PangoLibrary >> runner [
	
	^ TFSameThreadRunner new
]

{ #category : #'accessing platform' }
PangoLibrary >> unix32ModuleName [ 

	^ '/usr/lib/i386-linux-gnu/libpango-1.0.so.0'
]

{ #category : #'accessing platform' }
PangoLibrary >> unix64ModuleName [ 

	^ '/usr/lib/x86_64-linux-gnu/libpango-1.0.so.0'
]

{ #category : #'accessing platform' }
PangoLibrary >> win32ModuleName [
	
	"this could be  libpangowin32-1.0-0.dll instead"
	^ 'libpango-1.0-0.dll'
]
