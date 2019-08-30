Class {
	#name : #GClassBuilderTest,
	#superclass : #TestCase,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #tests }
GClassBuilderTest >> randomNameForTest [

	^ 'Test',
	((self toByteArray: DateAndTime now asDuration asMilliSeconds size: 4),
	 (self toByteArray: 9999 atRandom size: 2))
	 asInteger
	 asString
]

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

{ #category : #tests }
GClassBuilderTest >> toByteArray: aNumber size: sizeNumber [
	| result |
	
	result := aNumber asByteArray.
	result size < sizeNumber 
		ifTrue: [ result := (ByteArray new: sizeNumber - result size), result ].
	^ result
]
