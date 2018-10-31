Class {
	#name : #GtkAdapter,
	#superclass : #AbstractAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkAdapter class >> adaptingAliases [
	"Answers an array of aliases my class can adapt."

	^ #()

]

{ #category : #specs }
GtkAdapter class >> adaptingName [
	"Answers the name this component adapts. 
	 Override me if adapter will not forllo the common pattern"

	"Remove the 'Gtk' part will almost always give us the adapter name"
	^ (self name allButFirst: 3) asSymbol
]

{ #category : #initialize }
GtkAdapter class >> allAdapters [

	^ self allSubclasses
]

{ #category : #testing }
GtkAdapter class >> isAbstract [ 

	^ self = GtkAdapter
]

{ #category : #'as yet unclassified' }
GtkAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #protocol }
GtkAdapter >> layout: aSpecLayoutFrame [ 
	
	self flag: #TODO.
]

{ #category : #protocol }
GtkAdapter >> takeKeyboardFocus [
	
	self widgetDo: [ :w | w grabFocus ]
]
