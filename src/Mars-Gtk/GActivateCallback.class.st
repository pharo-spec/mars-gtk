"
The “activate” signal

void
user_function (GtkMenuItem *menuitem,
               gpointer     user_data)

Emitted when the item is activated.
"
Class {
	#name : #GActivateCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GActivateCallback class >> signalName [

	^ 'activate'
]

{ #category : #accessing }
GActivateCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :user_data | aBlock value ]
]
