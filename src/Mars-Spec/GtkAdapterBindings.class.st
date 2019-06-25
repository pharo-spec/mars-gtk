Class {
	#name : #GtkAdapterBindings,
	#superclass : #SpAdapterBindings,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #initialize }
GtkAdapterBindings >> allAdapters [
	
	^ GtkAdapter allAdapters
]

{ #category : #initialize }
GtkAdapterBindings >> initializeBindings [
	
	GtkAdapter allSubclasses 
		reject: #isAbstract
		thenDo: [ :each |
			bindings 
				at: each adaptingName
				put: each name ]
]
