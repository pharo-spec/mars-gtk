Class {
	#name : #GtkAbstractTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAbstractTextAdapter >> addModelTo: gtkTextView [
	super addModelTo: gtkTextView.
	self model text ifNotNil: [ :text | gtkTextView text: text asString ].

	self model
		whenTextChangedDo: [ :text | gtkTextView text: text asString ].
]

{ #category : #accessing }
GtkAbstractTextAdapter >> text: aString [ 
	
	widget text: aString asString
]
