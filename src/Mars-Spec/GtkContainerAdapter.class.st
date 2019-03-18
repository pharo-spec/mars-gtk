Class {
	#name : #GtkContainerAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #protocol }
GtkContainerAdapter >> add: anAdapter [ 
	
	self widgetDo: [ :this | 
		this packStart: anAdapter asWidget ]
]

{ #category : #building }
GtkContainerAdapter >> newWidget [

	^ GtkBox newVertical
		show;
		yourself
]
