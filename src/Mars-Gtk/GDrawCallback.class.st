Class {
	#name : #GDrawCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GDrawCallback >> do: aBlock [

	^ super do: [ :widget :cr :payload |
		aBlock value: cr  ]
]

{ #category : #accessing }
GDrawCallback >> signalName [

	^ 'draw'
]

{ #category : #accessing }
GDrawCallback >> signature [

	^ #(gboolean (void *widget, void *cr, void *payload))
]
