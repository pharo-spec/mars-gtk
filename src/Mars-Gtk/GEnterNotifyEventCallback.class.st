"
The “enter-notify-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::enter-notify-event will be emitted when the pointer enters the widget 's window.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_ENTER_NOTIFY_MASK mask.
This signal will be sent to the grab widget if there is one.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-enter-notify-event
"
Class {
	#name : #GEnterNotifyEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GEnterNotifyEventCallback class >> signalName [

	^ 'enter-notify-event'
]

{ #category : #accessing }
GEnterNotifyEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventCrossing fromHandle: event) ]
]

{ #category : #accessing }
GEnterNotifyEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
