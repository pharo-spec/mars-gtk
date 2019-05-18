Class {
	#name : #GdkEventButtonRelease,
	#superclass : #GdkEventButton,
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #testing }
GdkEventButtonRelease class >> isType: aType [

	^ aType = GDK_BUTTON_RELEASE
]
