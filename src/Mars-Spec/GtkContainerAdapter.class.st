Class {
	#name : #GtkContainerAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #protocol }
GtkContainerAdapter >> add: anAdapter [ 
	
	self widgetDo: [ :this | 
		this packStart: anAdapter asWidget ]
]

{ #category : #building }
GtkContainerAdapter >> buildWidget [

	^ GtkBox newVertical
]
