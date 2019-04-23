Class {
	#name : #GtkCodeAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkCodeAdapter >> addModelTo: gtkTextView [

	super addModelTo: gtkTextView.
	"gtkTextView monospace: true."
	self addMonospaceStyleFor: gtkTextView.
	"add style table"
	self flag: #TODO. "What do we do when color style changes?"
	gtkTextView textBuffer: (GtkTextBuffer newTable: GtkTextTagTable newForCode).
	"I need to recalculate style each time I get a change"
	gtkTextView textBuffer connectChanged: [
		self applyStyleTo: gtkTextView textBuffer ]
]

{ #category : #building }
GtkCodeAdapter >> addMonospaceStyleFor: gtkTextView [
	
	gtkTextView styleContext addProvider: self codeCssProvider
]

{ #category : #visiting }
GtkCodeAdapter >> applyStyleTo: textBuffer [

	textBuffer userActionDuring: [ 
		textBuffer removeAllTags.
		self behavior 
			ifNotNil: [ :aBehavior | 
				self setMethodText: textBuffer text class: aBehavior toBuffer: textBuffer ]
			ifNil: [ 
				self setExpressionText: textBuffer text toBuffer: textBuffer ] ]
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
	
	self flag: #TODO. "This has to came from the application"
	OSPlatform current isMacOS 
		ifTrue: [ ^ GtkCssProvider newFromString: '* { font: 12pt "Monaco" }' ].
	OSPlatform current isWindows
		ifTrue: [ ^ GtkCssProvider newFromString: '* { font: 12pt "Microsoft Sans Serif" }' ].
	
	^ GtkCssProvider newFromString: '* { font: 12pt "Sans" }'
]

{ #category : #'private-shout' }
GtkCodeAdapter >> setExpressionText: aString toBuffer: textBuffer [ 

	(STxStyleVisitor new 
		styleExpression: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #'private-shout' }
GtkCodeAdapter >> setMethodText: aString class: aClass toBuffer: textBuffer [ 

	(STxStyleVisitor new 
		contextClass: aClass;
		styleMethod: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #visiting }
GtkCodeAdapter >> setText: aString to: gtkTextView [

	gtkTextView text: aString.
	self applyStyleTo: gtkTextView textBuffer.
]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self innerWidget textBuffer asText
]
