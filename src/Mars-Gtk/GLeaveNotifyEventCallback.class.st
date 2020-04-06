"
The “leave-notify-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::leave-notify-event will be emitted when the pointer leaves the widget 's window.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_LEAVE_NOTIFY_MASK mask.
This signal will be sent to the grab widget if there is one.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-leave-notify-event
"
Class {
	#name : #GLeaveNotifyEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GLeaveNotifyEventCallback class >> signalName [

	^ 'leave-notify-event'
]

{ #category : #accessing }
GLeaveNotifyEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventCrossing fromHandle: event) ]
]

{ #category : #accessing }
GLeaveNotifyEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
