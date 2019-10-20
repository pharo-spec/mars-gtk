Class {
	#name : #GLibLibrary,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GLibLibrary >> win32LibraryName [

	^ 'libglib-2.0-0.dll'
]
