Class {
	#name : #GLibLibrary2,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GLibLibrary2 >> runner [

	^ TFWorker default.
]

{ #category : #'accessing platform' }
GLibLibrary2 >> win32ModuleName [

	^ 'libglib-2.0-0.dll'
]
