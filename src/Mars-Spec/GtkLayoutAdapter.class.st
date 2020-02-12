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
		childWidget show.
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
GtkLayoutAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
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

{ #category : #private }
GtkLayoutAdapter >> connectToEvents: aLayout [

	self presenter whenVisibleChangedDo: [ 	
		self presenter isVisible 
			ifTrue: [ widget show ] 
			ifFalse: [ widget hide ] ].
		
	aLayout whenChildrenAddedDo: [ :ann |
		self 
			add: ann child
			constraints: (aLayout constraintsFor: ann child) ].	
			
	aLayout whenChildrenRemovedDo: [ :ann |
		self remove: ann child ]
]

{ #category : #private }
GtkLayoutAdapter >> doLayout: aLayout [

	self subclassResponsibility
]

{ #category : #protocol }
GtkLayoutAdapter >> layout: aLayout [

	GtkRunLoop defer: [ 
		self doLayout: aLayout ]
]

{ #category : #removing }
GtkLayoutAdapter >> remove: aPresenter [

	^ self widgetDo: [ :w | 
		w remove: aPresenter adapter widget ]
]

{ #category : #protocol }
GtkLayoutAdapter >> removeSubWidgets [

	self widgetDo: [ :w |
		w removeAll ]
]

{ #category : #protocol }
GtkLayoutAdapter >> takeKeyboardFocus [

	self presenter presentersInFocusOrder 
		ifNotEmpty: [ :presenters | presenters first takeKeyboardFocus ]
]
