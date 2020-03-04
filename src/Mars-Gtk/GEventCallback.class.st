Class {
	#name : #GEventCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GEventCallback >> do: aBlock [
	"events are dangerous, they can hang the full system. 
	 I'll catch all errors and fork a debugger"
	self
		signature: self signature
		block: [ :widget :event :user_data |
			[ aBlock value: (GdkEvent newConcreteFromHandle: event) ]
			on: Error 
			fork: [ :e | e pass ]
			return: [ false ] ]
]

{ #category : #accessing }
GEventCallback >> signalName [

	^ 'event'
]

{ #category : #accessing }
GEventCallback >> signature [

	^ #(gboolean (void *widget, void *event, void *user_data))
]
