Class {
	#name : #GtkLibrary,
	#superclass : #FFILibrary,
	#category : 'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GtkLibrary >> macModuleName [ 
	^ '/usr/local/lib/libgtk-3.dylib'
]

{ #category : #'accessing platform' }
GtkLibrary >> unix32ModuleName [ 
	^ '/usr/lib/i386-linux-gnu/libgtk-3.so.0'
]

{ #category : #'accessing platform' }
GtkLibrary >> unix64ModuleName [ 
	^ '/usr/lib/x86_64-linux-gnu/libgtk-3.so.0'
]
