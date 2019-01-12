Class {
	#name : #StInspectorSlotNode,
	#superclass : #StInspectorNode,
	#instVars : [
		'slot'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #'instance creation' }
StInspectorSlotNode class >> newObject: anObject slot: aSlot [

	^ self basicNew 
		initializeObject: anObject slot: aSlot;
		yourself
]

{ #category : #initialization }
StInspectorSlotNode >> initializeObject: anObject slot: aSlot [

	self initialize.
	self object: anObject.
	slot := aSlot
]

{ #category : #accessing }
StInspectorSlotNode >> name [

	^ self slot name
]

{ #category : #accessing }
StInspectorSlotNode >> slot [
	^ slot
]

{ #category : #accessing }
StInspectorSlotNode >> value [ 

	^ self slot read: self object
]