Extension { #name : #FT2FFILibrary }

{ #category : #'*Mars-Gtk' }
FT2FFILibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'*Mars-Gtk' }
FT2FFILibrary >> macModuleName [ 
	
	GtkLibrary isDebug ifTrue: [ ^ '/opt/gtk/inst/lib/libfreetype.dylib' ]. 
	^ '/usr/local/lib/libfreetype.dylib'
	"^ 'libfreetype.dylib'"
]

{ #category : #'*Mars-Gtk' }
FT2FFILibrary >> runner [
	
	^ TFSameThreadRunner new
]
