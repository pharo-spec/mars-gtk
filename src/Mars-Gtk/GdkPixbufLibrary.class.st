Class {
	#name : #GdkPixbufLibrary,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GdkPixbufLibrary >> win32ModuleName [

	^ 'libgdk_pixbuf-2.0-0.dll'
]
