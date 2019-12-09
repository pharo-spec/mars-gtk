"
The “row-activated” signal

void
user_function (GtkListBox    *box,
               GtkListBoxRow *row,
               gpointer       user_data)

The ::row-activated signal is emitted when a row has been activated by the user.
"
Class {
	#name : #GListBoxRowActivatedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GListBoxRowActivatedCallback >> do: aBlock [ 

	^ self
		signature: self signature
		block: [ :box :row :user_data | 
			aBlock cull: row ]
]

{ #category : #accessing }
GListBoxRowActivatedCallback >> signalName [

	^ 'row-activated'
]

{ #category : #accessing }
GListBoxRowActivatedCallback >> signature [

	^  #(void (void *box, void *row, void *user_data))
]
