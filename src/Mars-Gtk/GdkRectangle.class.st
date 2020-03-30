"
Defines the position and size of a rectangle. It is identical to cairo_rectangle_int_t.

https://developer.gnome.org/gdk3/stable/gdk3-Points-Rectangles-and-Regions.html#GdkRectangle
"
Class {
	#name : #GdkRectangle,
	#superclass : #GtkStructure,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#classVars : [
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'as yet unclassified' }
GdkRectangle class >> fieldsDesc [ 
	"self rebuildFieldAccessors"

	^ #(
	int x;
	int y;
	int width;
	int height;	
	)
]

{ #category : #converting }
GdkRectangle >> asGdkRectangle [

	^ self
]

{ #category : #converting }
GdkRectangle >> asRectangle [

	^ (self x @ self y) extent: (self width @ self height)
]

{ #category : #'accessing structure variables' }
GdkRectangle >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GdkRectangle >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GdkRectangle >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GdkRectangle >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : #'accessing structure variables' }
GdkRectangle >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GdkRectangle >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkRectangle >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GdkRectangle >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
