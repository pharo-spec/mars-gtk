Class {
	#name : #GtkActionBarAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkActionBarAdapter >> addModelTo: gtkWidget [
	
	self model items do: [ :each |
		gtkWidget packStart: each buildWithSpec ]
]

{ #category : #building }
GtkActionBarAdapter >> buildWidget [
	| gtkWidget |

	gtkWidget := GtkActionBar new.
	self addModelTo: gtkWidget.
	^ gtkWidget
]
