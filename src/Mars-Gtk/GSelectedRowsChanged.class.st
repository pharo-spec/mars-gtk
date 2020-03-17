"
The “selected-rows-changed” signal
void
user_function (GtkListBox *box,
               gpointer    user_data)
The ::selected-rows-changed signal is emitted when the set of selected rows changes.

https://developer.gnome.org/gtk3/stable/GtkListBox.html#GtkListBox-selected-rows-changed
"
Class {
	#name : #GSelectedRowsChanged,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GSelectedRowsChanged >> do: aBlock [ 

	^ super do: [ :box :user_data | aBlock value ]
]

{ #category : #accessing }
GSelectedRowsChanged >> signalName [

	^ 'selected-rows-changed'
]

{ #category : #accessing }
GSelectedRowsChanged >> signature [

	^  #(void (void *box, void *user_data))
]
