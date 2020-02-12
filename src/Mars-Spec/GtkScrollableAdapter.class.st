Class {
	#name : #GtkScrollableAdapter,
	#superclass : #GtkLayoutAdapter,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #private }
GtkScrollableAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."

	^ childWidget
]

{ #category : #private }
GtkScrollableAdapter >> basicAdd: aPresenter constraints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
	gtkWidget add: childWidget.
			
	^ gtkWidget
]

{ #category : #private }
GtkScrollableAdapter >> doLayout: aLayout [

	widget := GtkScrolledWindow new.
	self connectToEvents: aLayout. 
	widget show
]
