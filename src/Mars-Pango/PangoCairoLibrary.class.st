"
I'm a library to add bindings with pango-cairo.
"
Class {
	#name : #PangoCairoLibrary,
	#superclass : #FFILibrary,
	#category : #'Mars-Pango-Base'
}

{ #category : #accessing }
PangoCairoLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'accessing platform' }
PangoCairoLibrary >> macModuleName [

	GtkLibrary isDebug ifTrue: [ ^ '/opt/gtk/inst/lib/libpangocairo-1.0.0.dylib' ]. 
	^ '/usr/local/lib/libpangocairo-1.0.0.dylib'

]

{ #category : #accessing }
PangoCairoLibrary >> runner [
	
	^ TFSameThreadRunner new
]

{ #category : #'accessing platform' }
PangoCairoLibrary >> unix32ModuleName [ 

	^ '/usr/lib/i386-linux-gnu/libpangocairo-1.0.so.0'
]

{ #category : #'accessing platform' }
PangoCairoLibrary >> unix64ModuleName [ 

	^ '/usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0'
]

{ #category : #'accessing platform' }
PangoCairoLibrary >> win32ModuleName [

	^ 'libpangocairo-1.0-0.dll'
]
