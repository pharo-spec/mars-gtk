Class {
	#name : #GSignalCallback,
	#superclass : #FFICallback,
	#instVars : [
		'signal',
		'registerId'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'instance creation' }
GSignalCallback class >> signal: aString signature: aSignature block: aBlock [

	^ (self 
		signature: aSignature 
		block: aBlock)
		signal: aString;
		yourself
]

{ #category : #accessing }
GSignalCallback >> registerId [
	^ registerId
]

{ #category : #accessing }
GSignalCallback >> registerId: anObject [
	registerId := anObject
]

{ #category : #accessing }
GSignalCallback >> signal [
	^ signal
]

{ #category : #accessing }
GSignalCallback >> signal: anObject [
	signal := anObject
]
