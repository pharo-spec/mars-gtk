Class {
	#name : #SpecGtkBackend,
	#superclass : #SpecApplicationBackend,
	#category : #'Mars-Gtk-Backend'
}

{ #category : #accessing }
SpecGtkBackend class >> backendName [
	
	^ #Gtk
]

{ #category : #private }
SpecGtkBackend >> adapterBindingsClass [

	^ GtkAdapterBindings
]

{ #category : #initialization }
SpecGtkBackend >> initialize [ 
	
	GtkApplication ensureRunning.	
	super initialize.

]

{ #category : #'ui notifying' }
SpecGtkBackend >> notifyError: aSpecNotification [

	GtkErrorDialog runMessage: aSpecNotification message
]

{ #category : #'ui notifying' }
SpecGtkBackend >> notifyInfo: aSpecNotification [

	GtkInformDialog runMessage: aSpecNotification message
]

{ #category : #'ui dialogs' }
SpecGtkBackend >> selectDirectoryTitle: aString [
	| dialog |

	dialog := GtkFileChooserDialog 
		newOpenDirectoryTitle: 'Select file...' 
		acceptLabel: 'Accept' 
		cancelLabel: 'Cancel'.
	dialog showAll; run.
	^ dialog isOk 
		ifTrue: [ dialog filename asFileReference ]
		ifFalse: [ nil ]
]

{ #category : #'ui dialogs' }
SpecGtkBackend >> selectFileTitle: aString [
	| dialog |

	dialog := GtkFileChooserDialog 
		newOpenFileTitle: 'Select file...' 
		acceptLabel: 'Accept' 
		cancelLabel: 'Cancel'.
	dialog showAll; run.
	^ dialog isOk 
		ifTrue: [ dialog filename asFileReference ]
		ifFalse: [ nil ]
]
