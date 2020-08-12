"
The “event-after” signal

void
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

After the emission of the “event” signal and (optionally) the second more specific signal, ::event-after will be emitted regardless of the previous two signals handlers return values.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-event-after
"
Class {
	#name : #GEventAfterCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GEventAfterCallback class >> signalName [

	^ 'event-after'
]

{ #category : #accessing }
GEventAfterCallback >> do: aBlock [
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
GEventAfterCallback >> signature [

	^ #(gboolean (void *widget, void *event, void *user_data))
]
