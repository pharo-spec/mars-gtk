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
 
	self widgetDo: [ :gtkWidget | | childWidget |
		childWidget := self 
			basicAdd: aPresenter 
			constraints: constraints 
			to: gtkWidget.
		"I'm keeping a reference to aPresenter into the built widget because in some cases 
		 it can be GC (in case of the on-the-fly creation, for example). 
		 Now this can be a real bad idea :)"
		childWidget data: aPresenter  ]
]

{ #category : #private }
GtkLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [ 

	self subclassResponsibility
]

{ #category : #building }
GtkLayoutAdapter >> buildWithSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]

{ #category : #building }
GtkLayoutAdapter >> buildWithSpec: aSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]
