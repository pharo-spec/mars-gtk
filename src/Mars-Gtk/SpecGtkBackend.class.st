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

{ #category : #'private notifying' }
SpecGtkBackend >> notifyError: aSpecNotification [

	aSpecNotification window ifNotNil: [ :aWindow |
		^ aWindow notifyError: aSpecNotification ].

	GtkErrorDialog runMessage: aSpecNotification message
]

{ #category : #'private notifying' }
SpecGtkBackend >> notifyInfo: aSpecNotification [

	GtkInformDialog runMessage: aSpecNotification message
]
