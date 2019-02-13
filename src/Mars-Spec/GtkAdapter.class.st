Class {
	#name : #GtkAdapter,
	#superclass : #AbstractAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkAdapter class >> adaptingName [
	"Answers the name this component adapts."

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

{ #category : #building }
GtkAdapter >> addModelTo: gtkWidget [
	
]

{ #category : #building }
GtkAdapter >> buildWidget [ 
	| gtkWidget |
	
	gtkWidget := self newWidget.
	self addModelTo: gtkWidget.
	^ gtkWidget
]

{ #category : #'as yet unclassified' }
GtkAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #protocol }
GtkAdapter >> layout: aSpecLayoutFrame [ 
	
	self flag: #TODO.
]

{ #category : #building }
GtkAdapter >> newWidget [

	^ self widgetClass new
]

{ #category : #accessing }
GtkAdapter >> setBalloonText: aString [ 
	
	^ self widget ifNotNil: [ self widget tooltipText: aString ]
]

{ #category : #protocol }
GtkAdapter >> takeKeyboardFocus [

	self widgetDo: [ :w | 
		self model window ifNotNil: [ :window | 
			window adapter
				ifNotNil: [ w grabFocus ]
				ifNil: [ w deferAction: [ w grabFocus ] ] ] ]
]

{ #category : #building }
GtkAdapter >> widgetClass [

	^ self subclassResponsibility
]
