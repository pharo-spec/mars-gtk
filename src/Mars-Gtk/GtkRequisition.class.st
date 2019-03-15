"
A GtkRequisition represents the desired size of a widget. 

https://developer.gnome.org/gtk3/unstable/GtkWidget.html#GtkRequisition-struct
"
Class {
	#name : #GtkRequisition,
	#superclass : #GtkStructure,
	#classVars : [
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'field definition' }
GtkRequisition class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	
	^ #(
	gint width;
 	gint height;	
	)
]

{ #category : #'accessing structure variables' }
GtkRequisition >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GtkRequisition >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GtkRequisition >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GtkRequisition >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]
