"
The “delete-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::delete-event signal is emitted if a user requests that a toplevel window is closed. The default handler for this signal destroys the window. Connecting gtk_widget_hide_on_delete() to this signal will cause the window to be hidden instead, so that it can later be shown again without reconstructing it.
"
Class {
	#name : #GDeleteEventCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GDeleteEventCallback class >> signalName [

	^ 'delete-event'
]

{ #category : #accessing }
GDeleteEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkEvent fromHandle: event) ]
]

{ #category : #accessing }
GDeleteEventCallback >> signature [

	^ #(gboolean (void *widget, void *event, void *user_data))
]
