"
The “event” signal
gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)
The GTK+ main loop will emit three signals for each GDK event delivered to a widget: one generic ::event signal, another, more specific, signal that matches the type of event delivered (e.g. “key-press-event”) and finally a generic “event-after” signal.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-event
"
Class {
	#name : #GEventCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GEventCallback class >> signalName [

	^ 'event'
]

{ #category : #accessing }
GEventCallback >> do: aBlock [
	"events are dangerous, they can hang the full system. 
	 I'll catch all errors and fork a debugger"
	self
		signature: self signature
		block: [ :widget :event :user_data |
			[ aBlock value: (GdkEvent newConcreteFromHandle: event) ]
			on: Error 
			fork: [ :e | e pass ]
			return: [ false ] ]
]

{ #category : #accessing }
GEventCallback >> signature [

	^ #(gboolean (void *widget, void *event, void *user_data))
]
