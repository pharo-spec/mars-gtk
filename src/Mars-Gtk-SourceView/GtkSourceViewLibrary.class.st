Class {
	#name : #GtkSourceViewLibrary,
	#superclass : #FFILibrary,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'accessing platform' }
GtkSourceViewLibrary >> macModuleName [

	GtkLibrary isDebug ifTrue: [ ^ self notYetImplemented ]. 
	^ '/usr/local/lib/libgtksourceview-4.dylib'
]
