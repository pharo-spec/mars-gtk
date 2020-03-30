"
The “value-changed” signal

void
user_function (GtkAdjustment *adjustment,
               gpointer       user_data)
Emitted when the “value” property has been changed.

Parameters
adjustment

the object which received the signal

 
user_data

user data set when the signal handler was connected.

 
Flags: No Recursion


"
Class {
	#name : #GtkAdjustmentValueChangedCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GtkAdjustmentValueChangedCallback class >> signalName [

	^ 'value-changed'
]

{ #category : #accessing }
GtkAdjustmentValueChangedCallback >> do: aBlock [

	super do: [ :adjustment :user_data |
		aBlock value: (GtkAdjustment fromHandle: adjustment) ]
]

{ #category : #accessing }
GtkAdjustmentValueChangedCallback >> signature [

	^ #(void (void *adjustment, void *user_data))
]
