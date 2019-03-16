Class {
	#name : #GButtonPressEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GButtonPressEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkEventButton fromHandle: event) ]
]

{ #category : #accessing }
GButtonPressEventCallback >> signalName [

	^ 'button-press-event'
]

{ #category : #accessing }
GButtonPressEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
