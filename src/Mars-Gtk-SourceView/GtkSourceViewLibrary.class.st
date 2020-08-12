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
	self flag: #TODO.	"Find a way to do this just once"
	^ self libraryName asFileReference exists
		and: [ (DynamicLoader loadLibrary: self libraryName) notNil ]
]

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> macLibraryName [

	GtkLibrary isDebug ifTrue: [ ^ '/Users/gtk3/gtk/inst/lib/libgtksourceview-4.dylib' ]. 
	^ '/usr/local/lib/libgtksourceview-4.dylib'
]

{ #category : #converting }
GtkSourceViewLibrary >> runner [
	
	^ GtkLibrary naturalRunner
]

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> unix64LibraryName [ 

	GtkLibrary isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgtksourceview-4.so' ]. 
	^ FFIUnix64LibraryFinder findLibrary: 'libgtksourceview-4.so'
]

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> win32LibraryName [ 

	^ 'libgtksourceview-3.0-1.dll'
]
