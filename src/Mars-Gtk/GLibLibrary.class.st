Class {
	#name : #GLibLibrary,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'as yet unclassified' }
GLibLibrary >> gSetPrgName: prgname [

	^ self ffiCall: #(void g_set_prgname (const gchar *prgname))
]

{ #category : #'accessing platform' }
GLibLibrary >> win32LibraryName [

	^ 'libglib-2.0-0.dll'
]
