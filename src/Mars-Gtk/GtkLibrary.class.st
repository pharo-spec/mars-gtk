Class {
	#name : #GtkLibrary,
	#superclass : #FFILibrary,
	#category : 'Mars-Gtk-Base'
}

{ #category : #'accessing platform' }
GtkLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI 
]

{ #category : #'accessing platform' }
GtkLibrary >> macModuleName [

	"^ '/opt/gtk/inst/lib/libgtk-3.dylib'" 
	^ '/usr/local/lib/libgtk-3.dylib'
]

{ #category : #'accessing platform' }
GtkLibrary >> runner [ 
	
	^ TFSameThreadRunner new
]

{ #category : #'accessing platform' }
GtkLibrary >> unix32ModuleName [ 
	^ '/usr/lib/i386-linux-gnu/libgtk-3.so.0'
]

{ #category : #'accessing platform' }
GtkLibrary >> unix64ModuleName [ 
	^ '/usr/lib/x86_64-linux-gnu/libgtk-3.so.0'
]

{ #category : #'accessing platform' }
GtkLibrary >> win32ModuleName [
	
	^ 'c:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libgtk-3-0.dll'
]
