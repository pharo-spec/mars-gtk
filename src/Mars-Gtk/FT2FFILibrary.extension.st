Extension { #name : #FT2FFILibrary }

{ #category : #'*Mars-Gtk' }
FT2FFILibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'*Mars-Gtk' }
FT2FFILibrary >> macLibraryName [ 
	
	GtkLibrary isDebug ifTrue: [ ^ '/Users/gtk3/gtk/inst/lib/libfreetype.dylib' ]. 
	^ '/usr/local/lib/libfreetype.dylib'
	"^ 'libfreetype.dylib'"
]

{ #category : #'*Mars-Gtk' }
FT2FFILibrary >> runner [
	
	^ TFSameThreadRunner new
]
