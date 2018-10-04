Class {
	#name : #GtkLibrary,
	#superclass : #FFILibrary,
	#category : 'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GtkLibrary >> macModuleName [ 
	^ '/usr/local/lib/libgtk-3.dylib'
]
