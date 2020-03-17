Class {
	#name : #GtkLabelAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkLabelAdapter >> addModelTo: gtkWidget [
	
	super addModelTo: gtkWidget.
	
	gtkWidget label: self getText.
	self presenter whenLabelChangedDo: [ 
		gtkWidget label: self getText ].
]

{ #category : #accessing }
GtkLabelAdapter >> getText [

	^ self presenter label valueForPresenter: self presenter
]

{ #category : #accessing }
GtkLabelAdapter >> label [

	^ self getText
]

{ #category : #factory }
GtkLabelAdapter >> newWidget [

	^ GtkLabel new
]
