Class {
	#name : #GtkCodeAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkCodeAdapter >> addModelTo: gtkTextView [

	super addModelTo: gtkTextView.
	"gtkTextView monospace: true."
	self addMonospaceStyleFor: gtkTextView
]

{ #category : #building }
GtkCodeAdapter >> addMonospaceStyleFor: gtkTextView [
	
	gtkTextView styleContext addProvider: self codeCssProvider
]

{ #category : #'api-shout' }
GtkCodeAdapter >> behavior [

	^ self model behavior
]

{ #category : #'private-shout' }
GtkCodeAdapter >> classOrMetaClass: aClass [
	"I will take the behavior from model, I just need to fire a refresh"
	| gtkTextView |
	
	gtkTextView := self widget child.
	self 
		setText: gtkTextView text 
		to: gtkTextView
]

{ #category : #building }
GtkCodeAdapter >> codeCssProvider [
	
	self flag: #TODO. "This has to came from the application"
	OSPlatform current isMacOS 
		ifTrue: [ ^ GtkCssProvider newFromString: '* { font: 12pt "Monaco" }' ].
	OSPlatform current isWindows
		ifTrue: [ ^ GtkCssProvider newFromString: '* { font: 12pt "Microsoft Sans Serif" }' ].
	
	^ GtkCssProvider newFromString: '* { font: 12pt "Sans" }'
]

{ #category : #visiting }
GtkCodeAdapter >> setText: aString to: gtkTextView [

	self behavior 
		ifNotNil: [ gtkTextView methodText: aString class: self behavior ]
		ifNil: [ gtkTextView expressionText: aString ]
]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self widget child textBuffer asText
]
