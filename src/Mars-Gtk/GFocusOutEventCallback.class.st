"
The “focus-out-event” signal
gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)
The ::focus-out-event signal will be emitted when the keyboard focus leaves the widget 's window.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_FOCUS_CHANGE_MASK mask.

Returns
	true to stop other handlers from being invoked for the event.
	false to propagate the event further

"
Class {
	#name : #GFocusOutEventCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GFocusOutEventCallback class >> signalName [

	^ 'focus-out-event'
]

{ #category : #accessing }
GFocusOutEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkEvent fromHandle: event) ]
]

{ #category : #accessing }
GFocusOutEventCallback >> signature [

	^ #(gboolean (void *widget, void *event, void *user_data))
]
