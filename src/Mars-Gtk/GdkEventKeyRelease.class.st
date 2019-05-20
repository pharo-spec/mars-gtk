Class {
	#name : #GdkEventKeyRelease,
	#superclass : #GdkEventKey,
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #testing }
GdkEventKeyRelease class >> isType: aType [ 

	^ aType = GDK_KEY_RELEASE
]

{ #category : #visiting }
GdkEventKeyRelease >> accept: aVisitor [

	^ aVisitor visitKeyUpEvent: self
]

{ #category : #testing }
GdkEventKeyRelease >> isKeyRelease [

	^ true
]
