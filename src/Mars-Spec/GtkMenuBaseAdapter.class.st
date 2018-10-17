Class {
	#name : #GtkMenuBaseAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkMenuBaseAdapter >> addModelTo: gtkWidget [
	self subclassResponsibility
]

{ #category : #building }
GtkMenuBaseAdapter >> buildWidget [
	| gtkWidget |

	gtkWidget := self gtkClass new.
	self addModelTo: gtkWidget.
	^ gtkWidget
]

{ #category : #accessing }
GtkMenuBaseAdapter >> gtkClass [
	
	^ self subclassResponsibility
]
