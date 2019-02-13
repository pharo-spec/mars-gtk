Class {
	#name : #GtkLayoutAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Layout-Base'
}

{ #category : #testing }
GtkLayoutAdapter class >> isAbstract [ 

	^ super isAbstract 
		or: [ self = GtkLayoutAdapter ]
]

{ #category : #accessing }
GtkLayoutAdapter >> add: aPresenter constraints: constraints [
 
	self widgetDo: [ :gtkWidget | 
		self 
			basicAdd: aPresenter 
			constraints: constraints 
			to: gtkWidget ]
]

{ #category : #private }
GtkLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [ 

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GtkLayoutAdapter >> buildWithSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]

{ #category : #'as yet unclassified' }
GtkLayoutAdapter >> buildWithSpec: aSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]
