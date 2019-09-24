Class {
	#name : #GScrollEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GScrollEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventScroll fromHandle: event) ]
]

{ #category : #accessing }
GScrollEventCallback >> signalName [

	^ 'scroll_event'
]

{ #category : #accessing }
GScrollEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
