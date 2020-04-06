Class {
	#name : #GCellRendererToggledCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GCellRendererToggledCallback class >> signalName [

	^ 'toggled'
]

{ #category : #accessing }
GCellRendererToggledCallback >> do: aBlock [

	self 
		signature: self signature
		block: [ :widget :path :user_data | aBlock value: path ]
]

{ #category : #accessing }
GCellRendererToggledCallback >> signature [

	^ #(void (void *widget, char *path, void *user_data))
]
