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
		self setText: gtkTextView text to: gtkTextView ]
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

{ #category : #'private factory' }
GtkCodeAdapter >> setExpressionText: aString toBuffer: textBuffer [ 

	textBuffer text: aString.
	(STxStyleVisitor new 
		visitExpression: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #'private factory' }
GtkCodeAdapter >> setMethodText: aString class: aClass toBuffer: textBuffer [ 

	textBuffer text: aString.
	(STxStyleVisitor new 
		contextClass: aClass;
		visitMethod: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #visiting }
GtkCodeAdapter >> setText: aString to: gtkTextView [
	| textBuffer |

	textBuffer := gtkTextView textBuffer.
	textBuffer userActionDuring: [ 
		textBuffer disconnect: 'changed' during: [ 
			self behavior 
				ifNotNil: [ :aBehavior | 
					self setMethodText: aString class: aBehavior toBuffer: textBuffer ]
				ifNil: [ 
					self setExpressionText: aString toBuffer: textBuffer ] ] ]
]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self widget child textBuffer asText
]
