"
The “clicked” signal

void
user_function (GtkButton *button,
               gpointer   user_data)

Emitted when the button has been activated (pressed and released).
"
Class {
	#name : #GClickedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GClickedCallback >> signalName [

	^ 'clicked'
]
