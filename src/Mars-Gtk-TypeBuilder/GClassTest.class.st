Class {
	#name : #GClassTest,
	#superclass : #GClassBaseTest,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #tests }
GClassTest >> testNew [
	| gClass object |

	gClass := GObject gSubclass: self randomNameForTest.
	object := gClass new.	
	
	self assert: object notNil.
	self assert: object isObject
]
