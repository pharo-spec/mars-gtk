Class {
	#name : #GtkWidgetTrace,
	#superclass : #Object,
	#instVars : [
		'widgetClass',
		'handle'
	],
	#category : #'Mars-Gtk-Utils'
}

{ #category : #accessing }
GtkWidgetTrace >> findAllPaths [
	| instance |
	
	instance := self widgetClass allInstances 
		detect: [ :each | each getHandle = self handle ]. 

	^ ReferenceFinder findAllPathsTo: instance
]

{ #category : #accessing }
GtkWidgetTrace >> handle [
	^ handle
]

{ #category : #accessing }
GtkWidgetTrace >> handle: anObject [
	handle := anObject
]

{ #category : #printing }
GtkWidgetTrace >> printOn: stream [ 

	stream << self widgetClass name << '(' << self handle printString << ')'
]

{ #category : #accessing }
GtkWidgetTrace >> referenceCount [

	^ (GtkWidget basicNew setHandle: self handle) referenceCount
]

{ #category : #accessing }
GtkWidgetTrace >> widgetClass [
	^ widgetClass
]

{ #category : #accessing }
GtkWidgetTrace >> widgetClass: anObject [
	widgetClass := anObject
]
