Class {
	#name : #GtkLabelAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkLabelAdapter >> addModelTo: gtkWidget [
	
	super addModelTo: gtkWidget.
	
	gtkWidget label: self model label.
	self model whenLabelChangedDo: [  gtkWidget label: self model label ].
]

{ #category : #accessing }
GtkLabelAdapter >> label [

	^ widget label
]

{ #category : #factory }
GtkLabelAdapter >> newWidget [

	^ GtkLabel new
]
