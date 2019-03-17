Class {
	#name : #GtkAbstractTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAbstractTextAdapter >> addModelTo: gtkWidget [

	super addModelTo: gtkWidget.
	self model text ifNotNil: [ :text | gtkWidget text: text asString ].
	self model whenTextChangedDo: [ :text | 
		gtkWidget text: text asString ].
]

{ #category : #accessing }
GtkAbstractTextAdapter >> text: aString [ 
	
	widget text: aString asString
]
