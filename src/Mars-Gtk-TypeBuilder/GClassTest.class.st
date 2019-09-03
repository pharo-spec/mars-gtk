Class {
	#name : #GClassTest,
	#superclass : #GClassBaseTest,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #tests }
GClassTest >> testNew [

	self testNewSimple.
	self testNewWithInterface
]

{ #category : #tests }
GClassTest >> testNewSimple [
	| name gClass object |

	name := self randomNameForTest.
	gClass := GObject gSubclass: name.
	object := gClass new.	

	self assert: object notNil.
	self assert: object isObject.
	self assert: (object gTypeName: gClass gType) equals: name.
	"self assert: object gType equals: gClass gType"
]

{ #category : #tests }
GClassTest >> testNewWithInterface [
	| name gClass object |

	name := self randomNameForTest.
	gClass := GObject 
		gSubclass: name 
		implements: GtkSourceCompletionProviderIface -> GtkSourceCompletionProviderForTest.
	object := gClass new.	

	self assert: object notNil.
	self assert: object isObject.
	self assert: (object gTypeName: gClass gType) equals: name.
	"self assert: object gType equals: gClass gType"
]
