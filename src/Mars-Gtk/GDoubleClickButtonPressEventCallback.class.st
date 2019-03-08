Class {
	#name : #GDoubleClickButtonPressEventCallback,
	#superclass : #GButtonPressEventCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GDoubleClickButtonPressEventCallback >> do: aBlock [
	self flag: #TODO. "According to #irc, the correct way to deal with a double click 
	 is with a GtkGestureMultipress, but this works and I do not have time to go deeper."

	super do: [ :event | 
		event isDoubleClick ifTrue: [
			aBlock fork.
			self stopPropagation ] ]
]
