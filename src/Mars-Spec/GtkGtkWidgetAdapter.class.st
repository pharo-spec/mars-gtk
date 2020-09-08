Class {
	#name : #GtkGtkWidgetAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkGtkWidgetAdapter >> newWidget [

	^ self presenter widget
]
