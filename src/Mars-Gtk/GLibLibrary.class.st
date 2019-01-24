Class {
	#name : #GLibLibrary,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GLibLibrary >> win32ModuleName [

	^ 'c:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libglib-2.0-0.dll'
]
