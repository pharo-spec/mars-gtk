Class {
	#name : #GMotionNotifyEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GMotionNotifyEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventMotion fromHandle: event) ]
]

{ #category : #accessing }
GMotionNotifyEventCallback >> signalName [

	^ 'motion_notify_event'
]

{ #category : #accessing }
GMotionNotifyEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
