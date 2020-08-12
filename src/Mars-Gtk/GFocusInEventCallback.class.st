"
The “focus-in-event” signal
gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)
The ::focus-in-event signal will be emitted when the keyboard focus enters the widget 's window.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_FOCUS_CHANGE_MASK mask.

Returns
	true to stop other handlers from being invoked for the event.
	false to propagate the event further
"
Class {
	#name : #GFocusInEventCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GFocusInEventCallback class >> signalName [

	^ 'focus-in-event'
]

{ #category : #accessing }
GFocusInEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkEvent fromHandle: event) ]
]

{ #category : #accessing }
GFocusInEventCallback >> signature [

	^ #(gboolean (void *widget, void *event, void *user_data))
]
