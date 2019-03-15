Class {
	#name : #GtkGridAdapter,
	#superclass : #GtkLayoutAdapter,
	#category : #'Mars-Spec-Layout-Grid'
}

{ #category : #private }
GtkGridAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
	
	self flag: #TODO. "this should ne constraints by column, row or own."

	childWidget 
		beVAlignCenter;
		hExpand: true
]

{ #category : #private }
GtkGridAdapter >> basicAdd: aPresenter constraints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
	self addConstraits: constraints toChild: childWidget.
	gtkWidget 
		attach: childWidget 
		at: constraints position 
		span: constraints span.
		
	^ gtkWidget
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
			rowSpacing: aLayout rowSpacing;
			columnHomogeneous: aLayout isColumnHomogeneous;
			rowHomogeneous: aLayout isRowHomogeneous;
			show ]
]
