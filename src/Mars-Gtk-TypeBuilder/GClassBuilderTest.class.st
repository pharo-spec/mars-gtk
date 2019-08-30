"
This class contains tests for GClassBuilder
"
Class {
	#name : #GClassBuilderTest,
	#superclass : #GClassBaseTest,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #tests }
GClassBuilderTest >> testExtendGObject [
	| gClass name |

	"If I execute this a lot I will have a leak problem ;)"
	name := self randomNameForTest.

	gClass := GClassBuilder build: [ :builder |
		builder 
			name: name;
			parent: GObject ].
		
	self assert: gClass gType notNil.
	self deny: gClass gType equals: 0.
	
	self 
		should: [ 
			GClassBuilder build: [ :builder |
				builder 
					name: name;
					parent: GObject ] ]
		raise: Error
]
