"
The “toggled” signal

void
user_function (GtkToggleButton *togglebutton,
               gpointer         user_data)

Should be connected if you wish to perform an action whenever the GtkToggleButton's state is changed.
"
Class {
	#name : #GToggledCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GToggledCallback class >> signalName [

	^ 'toggled'
]

{ #category : #accessing }
GToggledCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :user_data | aBlock value ]
]
