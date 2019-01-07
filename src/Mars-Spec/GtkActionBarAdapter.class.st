Class {
	#name : #GtkActionBarAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkActionBarAdapter >> addModelTo: gtkWidget [
	
	(self model items 
		at: #start 
		ifAbsent: [ #() ]) 
		do: [ :each | gtkWidget packStart: each buildWithSpec ].

	(self model items 
		at: #end 
		ifAbsent: [ #() ]) 
		do: [ :each | gtkWidget packEnd: each buildWithSpec ]		
]

{ #category : #building }
GtkActionBarAdapter >> widgetClass [

	^ GtkActionBar
]
