Class {
	#name : #StInspectorSelfNode,
	#superclass : #StInspectorNode,
	#category : #'Mars-Tools-Inspector'
}

{ #category : #'instance creation' }
StInspectorSelfNode class >> newObject: anObject [ 

	^ self new object: anObject
]

{ #category : #accessing }
StInspectorSelfNode >> name [ 

	^ 'self'
]

{ #category : #accessing }
StInspectorSelfNode >> value [

	^ self object
]
