Class {
	#name : #GGenericSignalCallback,
	#superclass : #GSignalCallback,
	#instVars : [
		'signalName'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #'instance creation' }
GGenericSignalCallback class >> signal: aString signature: aSignature block: aBlock [

	^ (self 
		signature: aSignature 
		block: aBlock)
		signalName: aString;
		yourself
]

{ #category : #accessing }
GGenericSignalCallback >> signalName [

	^ signalName
]

{ #category : #accessing }
GGenericSignalCallback >> signalName: aString [

	signalName := aString
]
