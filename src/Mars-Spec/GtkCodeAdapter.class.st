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

{ #category : #adding }
GtkCodeAdapter >> addMonospaceStyleFor: gtkTextView [
	
	gtkTextView styleContext addProvider: self newCssProvider.
	
]

{ #category : #'as yet unclassified' }
GtkCodeAdapter >> classOrMetaClass: anObject [
	"ignore, I do not need it right now"
]

{ #category : #adding }
GtkCodeAdapter >> newCssProvider [

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
