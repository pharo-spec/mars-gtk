Class {
	#name : #GtkTestCase,
	#superclass : #TestCase,
	#category : #'Mars-Gtk-Tests'
}

{ #category : #testing }
GtkTestCase class >> isAbstract [ 

	^ self = GtkTestCase 
]

{ #category : #accessing }
GtkTestCase class >> resources [

	^ { GtkTestResource }
]
