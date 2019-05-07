"
The “hide” signal

void
user_function (GtkWidget *widget,
               gpointer   user_data)

The ::hide signal is emitted when widget is hidden, for example with gtk_widget_hide().

"
Class {
	#name : #GHideCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GHideCallback >> signalName [

	^ 'hide'
]
