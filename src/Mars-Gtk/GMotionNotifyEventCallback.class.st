"
The “motion-notify-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::motion-notify-event signal is emitted when the pointer moves over the widget's GdkWindow.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_POINTER_MOTION_MASK mask.
This signal will be sent to the grab widget if there is one.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-motion-notify-event
"
Class {
	#name : #GMotionNotifyEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GMotionNotifyEventCallback class >> signalName [

	^ 'motion-notify-event'
]

{ #category : #accessing }
GMotionNotifyEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkEventMotion fromHandle: event) ]
]

{ #category : #accessing }
GMotionNotifyEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
