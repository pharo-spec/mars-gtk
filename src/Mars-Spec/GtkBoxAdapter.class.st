Class {
	#name : #GtkBoxAdapter,
	#superclass : #GtkLayoutAdapter,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #accessing }
GtkBoxAdapter >> add: aPresenter constraints: constraints [
 
	self widgetDo: [ :gtkWidget | 
		self 
			basicAdd: aPresenter 
			constaints: constraints 
			to: gtkWidget ]
]

{ #category : #private }
GtkBoxAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
]

{ #category : #private }
GtkBoxAdapter >> basicAdd: aPresenter constaints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec.
	self addConstraits: constraints toChild: childWidget.
	constraints isPlacedAtStart
		ifTrue: [ 
			gtkWidget 
				packStart: childWidget 
				expand: constraints isExpand 
				fill: constraints isFill
				padding: constraints padding ]
		ifFalse: [ 
			gtkWidget 
				packEnd: childWidget 
				expand: constraints isExpand 
				fill: constraints isFill 
				padding: constraints padding ]
]

{ #category : #building }
GtkBoxAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #building }
GtkBoxAdapter >> layout: aLayout [

	"build of widget was differed up to here (to know what is the direction)"
	widget := aLayout direction newWidgetOn: self.
]

{ #category : #factory }
GtkBoxAdapter >> newHorizontal [

	^ GtkBox newHorizontal
]

{ #category : #factory }
GtkBoxAdapter >> newVertical [

	^ GtkBox newVertical
]
