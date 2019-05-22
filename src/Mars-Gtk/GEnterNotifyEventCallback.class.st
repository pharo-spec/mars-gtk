Class {
	#name : #GEnterNotifyEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GEnterNotifyEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventCrossing fromHandle: event) ]
]

{ #category : #accessing }
GEnterNotifyEventCallback >> signalName [

	^ 'enter_notify_event'
]

{ #category : #accessing }
GEnterNotifyEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
