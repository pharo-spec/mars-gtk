Class {
	#name : #GtkContainerAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #protocol }
GtkContainerAdapter >> add: anAdapter [ 
	
	self widgetDo: [ :w | 
		w packStart: anAdapter widget ]
]

{ #category : #building }
GtkContainerAdapter >> newWidget [

	^ GtkBox newVertical
		show;
		yourself
]
