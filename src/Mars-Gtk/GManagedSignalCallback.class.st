Class {
	#name : #GManagedSignalCallback,
	#superclass : #GSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #'instance creation' }
GManagedSignalCallback class >> do: aBlock [

	^ self new do: aBlock
]

{ #category : #connecting }
GManagedSignalCallback >> connectTo: aWidget [

	aWidget connectSignal: self
]

{ #category : #connecting }
GManagedSignalCallback >> disconnectFrom: aWidget [

	aWidget disconnectCallback: self	
]

{ #category : #accessing }
GManagedSignalCallback >> do: aBlock [

	self 
		signature: self signature 
		block: aBlock
]

{ #category : #accessing }
GManagedSignalCallback >> signalName [

	^ self subclassResponsibility
]

{ #category : #accessing }
GManagedSignalCallback >> signature [

	^ #(void (void *widget, void *data))
]
