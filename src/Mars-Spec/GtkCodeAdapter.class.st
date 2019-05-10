Class {
	#name : #GtkCodeAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkCodeAdapter >> addMonospaceStyleFor: gtkTextView [
	
	gtkTextView styleContext addProvider: self codeCssProvider
]

{ #category : #building }
GtkCodeAdapter >> addTextTo: gtkTextView [
	
	"gtkTextView monospace: true."
	self addMonospaceStyleFor: gtkTextView.
	"add style table"
	self model hasSyntaxHighlight ifTrue: [ 
		self flag: #TODO. "What do we do when color style changes?"
		gtkTextView textBuffer: (GtkTextBuffer newTable: GtkTextTagTable newForCode).
		"I need to recalculate style each time I get a change"
		gtkTextView textBuffer connectChanged: [ 
			self applyFullStyleTo: gtkTextView textBuffer ] ]	.
		
	super addTextTo: gtkTextView
]

{ #category : #visiting }
GtkCodeAdapter >> applyFullStyleTo: textBuffer [

	textBuffer userActionDuring: [ 
		self applyStyleTo: textBuffer ]
]

{ #category : #visiting }
GtkCodeAdapter >> applyStyleTo: textBuffer [

	self model hasSyntaxHighlight ifFalse: [ ^ self ].

	textBuffer removeAllTags.
	self behavior 
		ifNotNil: [ :aBehavior | 
			self setMethodText: textBuffer text class: aBehavior toBuffer: textBuffer ]
		ifNil: [ 
			self setExpressionText: textBuffer text toBuffer: textBuffer ]
]

{ #category : #'api-shout' }
GtkCodeAdapter >> behavior [

	^ self model behavior
]

{ #category : #'private-shout' }
GtkCodeAdapter >> classOrMetaClass: aClass [
	"I will take the behavior from model, I just need to fire a refresh"

	self applyStyleTo: self innerWidget textBuffer
]

{ #category : #building }
GtkCodeAdapter >> codeCssProvider [
	
	self flag: #TODO. "Demeters law"
	^ self model application backend codeCssProvider
]

{ #category : #'private-shout' }
GtkCodeAdapter >> setExpressionText: aString toBuffer: textBuffer [ 

	(GtkTextStyleVisitor new 
		styleExpression: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #'private-shout' }
GtkCodeAdapter >> setMethodText: aString class: aClass toBuffer: textBuffer [ 

	(GtkTextStyleVisitor new 
		contextClass: aClass;
		styleMethod: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self innerWidget textBuffer asText
]
