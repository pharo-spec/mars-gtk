"
I am the library to GtkSourceView. 
"
Class {
	#name : #GtkSourceViewLibrary,
	#superclass : #FFILibrary,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #converting }
GtkSourceViewLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #testing }
GtkSourceViewLibrary >> isAvailable [

	self flag: #TODO. "Find a way to do this just once"
	^ self moduleName asFileReference exists
		and: [ (DynamicLoader loadLibrary: self moduleName) notNil ]
]

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> macModuleName [

	GtkLibrary isDebug ifTrue: [ ^ self notYetImplemented ]. 
	^ '/usr/local/lib/libgtksourceview-4.dylib'
]

{ #category : #converting }
GtkSourceViewLibrary >> runner [
	
	^ TFMainThreadRunner uniqueInstance 
]

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> unix64ModuleName [ 

	^ '/usr/lib/x86_64-linux-gnu/libgtksourceview-3.0.so.1'
]

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> win32ModuleName [ 

	^ 'libgtksourceview-3.0-1.dll'
]
