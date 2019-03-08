Class {
	#name : #GButtonPressEventCallback,
	#superclass : #GManagedSignalCallback,
	#instVars : [
		'stopPropagation'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GButtonPressEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkEventButton fromHandle: event).
			self shouldStopPropagation ]
]

{ #category : #accessing }
GButtonPressEventCallback >> initialize [ 

	super initialize.
	stopPropagation := false
]

{ #category : #testing }
GButtonPressEventCallback >> shouldStopPropagation [

	^ stopPropagation
]

{ #category : #accessing }
GButtonPressEventCallback >> signalName [

	^ 'button-press-event'
]

{ #category : #accessing }
GButtonPressEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]

{ #category : #accessing }
GButtonPressEventCallback >> stopPropagation [

	stopPropagation := true
]
