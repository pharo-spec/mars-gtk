Class {
	#name : #GtkSourceViewLibrary,
	#superclass : #FFILibrary,
	#category : #'Mars-Gtk-SourceView'
}

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
