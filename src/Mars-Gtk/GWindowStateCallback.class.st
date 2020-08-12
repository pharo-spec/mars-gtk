"
The “window-state-event” signal
gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)
The ::window-state-event will be emitted when the state of the toplevel window associated to the widget changes.
To receive this signal the GdkWindow associated to the widget needs to enable the GDK_STRUCTURE_MASK mask. GDK will enable this mask automatically for all new windows.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-window-state-event
"
Class {
	#name : #GWindowStateCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #signalling }
GWindowStateCallback class >> signalName [

	^ 'window-state-event'
]

{ #category : #accessing }
GWindowStateCallback >> do: aBlock [

	super do: [ :widget :event :user_data | 
		aBlock value: (GdkEvent newConcreteFromHandle: event) ]
]

{ #category : #accessing }
GWindowStateCallback >> signature [

	^ #(void (void *widget, void *event, void *user_data))
]
