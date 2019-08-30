Class {
	#name : #GClassBaseTest,
	#superclass : #TestCase,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #testing }
GClassBaseTest class >> isAbstract [

	^ self = GClassBaseTest
]

{ #category : #private }
GClassBaseTest >> randomNameForTest [

	^ 'Test',
	((self toByteArray: DateAndTime now asDuration asMilliSeconds size: 4),
	 (self toByteArray: 9999 atRandom size: 2))
	 asInteger
	 asString
]

{ #category : #private }
GClassBaseTest >> toByteArray: aNumber size: sizeNumber [
	| result |
	
	result := aNumber asByteArray.
	result size < sizeNumber 
		ifTrue: [ result := (ByteArray new: sizeNumber - result size), result ].
	^ result
]
