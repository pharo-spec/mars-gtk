Class {
	#name : #GLeaveNotifyEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GLeaveNotifyEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventCrossing fromHandle: event) ]
]

{ #category : #accessing }
GLeaveNotifyEventCallback >> signalName [

	^ 'leave_notify_event'
]

{ #category : #accessing }
GLeaveNotifyEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
