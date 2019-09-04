Class {
	#name : #GClassForTest,
	#superclass : #GObject,
	#instVars : [
		'initialized'
	],
	#classInstVars : [
		'initialized'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #accessing }
GClassForTest class >> gClass [ 

	^ GClass gClassAt: self
]

{ #category : #accessing }
GClassForTest class >> gType [ 

	^ self gClass type
]

{ #category : #'class initialization' }
GClassForTest class >> initialize [

	"GClass install: self"
]

{ #category : #'class initialization' }
GClassForTest class >> initialize: aHandle [
	
	initialized := true
]

{ #category : #'class initialization' }
GClassForTest class >> initializeInterfaces: aGClass [

]

{ #category : #testing }
GClassForTest class >> isInitialized [

	^ initialized
]

{ #category : #'instance creation' }
GClassForTest class >> new [ 

	^ self gClass new
]

{ #category : #accessing }
GClassForTest class >> reset [

	initialized := false
]

{ #category : #initialization }
GClassForTest >> initialize [

	super initialize.
	initialized := true
]

{ #category : #testing }
GClassForTest >> isInitialized [

	^ initialized == true
]
