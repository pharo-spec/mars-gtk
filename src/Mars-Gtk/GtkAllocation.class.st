"
A GtkAllocation of a widget represents region which has been allocated to the widget by its parent. It is a subregion of its parents allocation. See GtkWidget’s geometry management section for more information.

This is a typedef of GtkRectangle:

typedef 	GdkRectangle	   GtkAllocation;


"
Class {
	#name : #GtkAllocation,
	#superclass : #GdkRectangle,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'accessing structure variables' }
GtkAllocation >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GtkAllocation >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GtkAllocation >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GtkAllocation >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : #'accessing structure variables' }
GtkAllocation >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GtkAllocation >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GtkAllocation >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GtkAllocation >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
