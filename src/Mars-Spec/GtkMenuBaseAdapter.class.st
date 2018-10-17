Class {
	#name : #GtkMenuBaseAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkMenuBaseAdapter >> buildWidget [
	| gtkWidget |

	gtkWidget := self gtkClass new.
	gtkWidget adaptFromSpec: self model.
	^ gtkWidget
]

{ #category : #accessing }
GtkMenuBaseAdapter >> gtkClass [
	
	^ self subclassResponsibility
]
