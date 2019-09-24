Class {
	#name : #GButtonReleaseEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GButtonReleaseEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkEventButton fromHandle: event) ]
]

{ #category : #accessing }
GButtonReleaseEventCallback >> signalName [

	^ 'button-release-event'
]

{ #category : #accessing }
GButtonReleaseEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
