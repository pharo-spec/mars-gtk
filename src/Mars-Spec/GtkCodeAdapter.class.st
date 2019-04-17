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

{ #category : #'private factory' }
GtkCodeAdapter >> newExpressionText: aString [ 
	| textBuffer |
	
	textBuffer := GtkTextBuffer newTable: GtkTextTagTable newForCode.
	textBuffer text: aString.
	(StStyleVisitor new 
		visitExpression: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].
	
	^ textBuffer
]

{ #category : #'private factory' }
GtkCodeAdapter >> newMethodText: aString class: aClass [ 
	| textBuffer |
	
	aString isEmptyOrNil ifTrue: [ ^ self text: aString ].

	textBuffer := GtkTextBuffer newTable: GtkTextTagTable newForCode.
	textBuffer text: aString.
	(StStyleVisitor new 
		contextClass: aClass;
		visitMethod: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].
		
	^ textBuffer
]

{ #category : #visiting }
GtkCodeAdapter >> setText: aString to: gtkTextView [
	| textBuffer |

	"remove existing callbacks to avoid cycles"
	gtkTextView textBuffer disconnectAll.
	textBuffer := self behavior 
		ifNotNil: [ self newMethodText: aString class: self behavior ]
		ifNil: [ self newExpressionText: aString ].
	"it will change the textBuffer, so I reconnect to force a reformat"
	textBuffer connectChanged: [ 
		self setText: gtkTextView text to: gtkTextView ].
	
	gtkTextView textBuffer: textBuffer 
]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self widget child textBuffer asText
]
