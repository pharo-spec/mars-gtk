Class {
	#name : #GtkGridAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkGridAdapter >> add: aPresenter constraints: constraints [
 
	self widgetDo: [ :gtkWidget | 
		self 
			basicAdd: aPresenter 
			constaints: constraints 
			to: gtkWidget ]
]

{ #category : #private }
GtkGridAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
	
	self flag: #TODO. "this should ne constraints by column, row or own."

	childWidget 
		beVAlignCenter;
		hExpand: true
]

{ #category : #private }
GtkGridAdapter >> basicAdd: aPresenter constaints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec.
	self addConstraits: constraints toChild: childWidget.
	gtkWidget attach: childWidget 
		at: constraints position 
		span: constraints span
]

{ #category : #building }
GtkGridAdapter >> buildWidget [

	^ GtkGrid new
]

{ #category : #building }
GtkGridAdapter >> layout: aLayout [
	
	self widgetDo: [ :w |
		w 
			borderWidth: aLayout borderWidth;
			columnSpacing: aLayout columnSpacing;
			rowSpacing: aLayout rowSpacing ]
]
