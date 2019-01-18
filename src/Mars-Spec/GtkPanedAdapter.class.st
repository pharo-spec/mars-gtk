Class {
	#name : #GtkPanedAdapter,
	#superclass : #GtkLayoutAdapter,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #accessing }
GtkPanedAdapter >> add: aPresenter constraints: constraints [
 
	self widgetDo: [ :gtkWidget | 
		self 
			basicAdd: aPresenter 
			constaints: constraints 
			to: gtkWidget ]
]

{ #category : #private }
GtkPanedAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."

	^ childWidget
]

{ #category : #private }
GtkPanedAdapter >> basicAdd: aPresenter constaints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec.
	self addConstraits: constraints toChild: childWidget.
	gtkWidget children 
		ifNotEmpty: [ 
			gtkWidget 
				pack2: childWidget 
				resize: constraints canResize 
				shrink: constraints canShrink ]
		ifEmpty: [
			gtkWidget 
				pack1: childWidget 
				resize: constraints canResize 
				shrink: constraints canShrink ].
			
	^ gtkWidget
]

{ #category : #building }
GtkPanedAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #building }
GtkPanedAdapter >> layout: aLayout [

	"build of widget was differed up to here (to know what is the direction)"
	widget := aLayout direction newWidgetOn: self
]

{ #category : #factory }
GtkPanedAdapter >> newHorizontal [

	^ GtkPaned newHorizontal
]

{ #category : #factory }
GtkPanedAdapter >> newVertical [

	^ GtkPaned newVertical
]
