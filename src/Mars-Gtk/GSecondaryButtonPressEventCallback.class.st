Class {
	#name : #GSecondaryButtonPressEventCallback,
	#superclass : #GButtonPressEventCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GSecondaryButtonPressEventCallback >> do: aBlock [

	super do: [ :event |
		event isSecondaryButton
			ifTrue:[ aBlock cull: event ]
			ifFalse: [ false ] ]
]
