"
The “key-release-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::key-release-event signal is emitted when a key is released.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_KEY_RELEASE_MASK mask.
This signal will be sent to the grab widget if there is one.


"
Class {
	#name : #GKeyReleaseEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GKeyReleaseEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventKey fromHandle: event) ]
]

{ #category : #accessing }
GKeyReleaseEventCallback >> signalName [

	^ 'key-release-event'
]

{ #category : #accessing }
GKeyReleaseEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
