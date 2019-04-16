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

{ #category : #'private-shout' }
GtkCodeAdapter >> classOrMetaClass: anObject [
	"ignore, I do not need it right now"
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

	self model behavior 
		ifNotNil: [ gtkTextView methodText: aString class: Object ]
		ifNil: [ gtkTextView expressionText: aString ]
]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self widget child textBuffer asText
]
