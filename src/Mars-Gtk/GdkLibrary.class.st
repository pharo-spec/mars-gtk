Class {
	#name : #GdkLibrary,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GdkLibrary >> win32ModuleName [

	^ 'libgdk-3-0.dll'
]
