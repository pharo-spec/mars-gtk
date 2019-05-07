"
The “key-press-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::key-press-event signal is emitted when a key is pressed. The signal emission will reoccur at the key-repeat rate when the key is kept pressed.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_KEY_PRESS_MASK mask.
This signal will be sent to the grab widget if there is one.
"
Class {
	#name : #GKeyPressEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GKeyPressEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventKey fromHandle: event) ]
]

{ #category : #accessing }
GKeyPressEventCallback >> signalName [

	^ 'key-press-event'
]

{ #category : #accessing }
GKeyPressEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
