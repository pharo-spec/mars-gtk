Class {
	#name : #GtkCodeAdapter,
	#superclass : #GtkTextAdapter,
	#instVars : [
		'completionProvider',
		'lastPopover',
		'userAction'
	],
	#category : #'Mars-Spec-Code'
}

{ #category : #building }
GtkCodeAdapter >> addModelTo: gtkTextView [ 

	self addSourceFeaturesTo: gtkTextView.	
	super addModelTo: gtkTextView
]

{ #category : #building }
GtkCodeAdapter >> addMonospaceStyleFor: gtkTextView [
	
	gtkTextView styleContext addClass: 'code'
]

{ #category : #building }
GtkCodeAdapter >> addSourceCompletionProviderTo: gtkSourceView [

	gtkSourceView completion
		showHeaders: false;
		showIcons: true;
		addProvider: (completionProvider := GtkPharoSourceCompletionProvider new
			completionEngine: (self newCompletionEngine: self presenter interactionModel);
			yourself)
]

{ #category : #building }
GtkCodeAdapter >> addSourceFeaturesTo: gtkSourceView [
	
	self flag: #TODO. "Find a better way to validate this"
	(gtkSourceView isKindOf: GtkSourceView) ifFalse: [ ^ self ].
	  
	self flag: #TODO. "All this needs to come from settings"
	gtkSourceView 
		showLineNumbers: self presenter hasLineNumbers;
		autoIndent: true;
		indentOnTab: true;
		tabWidth: 4.

	gtkSourceView textBuffer 
		infiniteUndoLevels;
		highlightMatchingBrackets: true.
		
	self presenter interactionModel ifNotNil: [
		self addSourceCompletionProviderTo: gtkSourceView ].
	
	self presenter whenLineNumbersChangedDo: [ :hasLineNumbers |
		gtkSourceView showLineNumbers: hasLineNumbers ]
]

{ #category : #building }
GtkCodeAdapter >> addTextTo: gtkTextView [
	
	"gtkTextView monospace: true."
	self addMonospaceStyleFor: gtkTextView.
	"add style table"
	self model hasSyntaxHighlight ifTrue: [ 
		self flag: #TODO. "What do we do when color style changes?"
		gtkTextView textBuffer: (self bufferClass newTable: GtkTextTagTable newForCode).
		"I need to recalculate style each time I get a change"
		gtkTextView textBuffer connectChanged: [ 
			self applyFullStyleTo: gtkTextView textBuffer ] ]	.
		
	super addTextTo: gtkTextView
]

{ #category : #visiting }
GtkCodeAdapter >> applyFullStyleTo: textBuffer [

	"If I am in an user action, I will not do anything now, just register for change (it 
	 will be executed later)."
	self userActionDo: [ :anUserAction | 
		anUserAction registerChange.
		^ self ].

	textBuffer userActionDuring: [ 
		self applyStyleTo: textBuffer ]
]

{ #category : #visiting }
GtkCodeAdapter >> applyStyleTo: textBuffer [

	self presenter hasSyntaxHighlight ifFalse: [ ^ self ].
	self presenter text ifEmpty: [ ^ self ].
	textBuffer removeAllTags.
	self behavior
		ifNotNil: [ :aBehavior |
			self setMethodText: textBuffer text class: aBehavior toBuffer: textBuffer ]
		ifNil: [ 
			self setExpressionText: textBuffer text toBuffer: textBuffer ]
]

{ #category : #'api-shout' }
GtkCodeAdapter >> behavior [

	^ self presenter behavior
]

{ #category : #'private-shout' }
GtkCodeAdapter >> behaviorOrReceiverClass [

	self presenter behavior ifNotNil: [ :aBehavior | ^ aBehavior ].
	self presenter doItReceiver ifNotNil: [ :anObject | ^ anObject class ].
	^ nil
]

{ #category : #building }
GtkCodeAdapter >> bufferClass [

	^ GtkSourceViewLibrary uniqueInstance isAvailable 
		ifTrue: [ GtkSourceBuffer ]
		ifFalse: [ super bufferClass ]
]

{ #category : #'private-shout' }
GtkCodeAdapter >> classOrMetaClass: aClass [
	"I will take the behavior from model, I just need to fire a refresh"

	self innerWidgetDo: [ :w | 
		self applyFullStyleTo: w textBuffer ].
	self updateCompletionProvider	
]

{ #category : #'api-shout' }
GtkCodeAdapter >> doItContext [ 

	^ self presenter doItContext
]

{ #category : #'api-shout' }
GtkCodeAdapter >> doItReceiver [

	^ self presenter doItReceiver
]

{ #category : #api }
GtkCodeAdapter >> hasSyntaxHighlightEnabled [
	"this is used just for testing"
	
	^ self presenter hasSyntaxHighlight
]

{ #category : #api }
GtkCodeAdapter >> insertPopoverAfterCurrentSelection: aPresenter [

	self innerWidgetDo: [ :w | | endIter |
		lastPopover := self presenter newPopover
			bePositionRight;
			presenter: aPresenter;
			buildWithSpec;
			yourself.

		endIter := w textBuffer 
			selectionIteratorsDo: [ :start :end | end ] 
			ifNone: [ nil ].
		 
		"15@0 is a magic number to place the popover where I want. Not cool, but hard to 
		 do better :( "
		lastPopover popupPointingTo: ((w iterLocation: endIter) translateBy: (15@0)).
		lastPopover takeKeyboardFocus ]
]

{ #category : #api }
GtkCodeAdapter >> interactionModel: anInteractionModel [

	self classOrMetaClass: anInteractionModel behavior
]

{ #category : #'instance creation' }
GtkCodeAdapter >> newCompletionEngine: anInteractionModel [

	^ GtkCodeCompletionEngine new 
		scripting: anInteractionModel isForScripting;
		doItRequestor: anInteractionModel;
		doItContext: anInteractionModel doItContext;
		completionClass: anInteractionModel selectedClassOrMetaClass;
		yourself
]

{ #category : #'as yet unclassified' }
GtkCodeAdapter >> notify: aString at: aNumber in: anObject [
	self flag: #TODO. "What to do here?"
]

{ #category : #'private-shout' }
GtkCodeAdapter >> setExpressionText: aString toBuffer: textBuffer [ 

	(GtkTextStyleVisitor new 
		requestor: self presenter;
		contextClass: self behaviorOrReceiverClass;
		styleExpression: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #'private-shout' }
GtkCodeAdapter >> setMethodText: aString class: aClass toBuffer: textBuffer [ 

	(GtkTextStyleVisitor new
		requestor: self; 
		contextClass: aClass;
		styleMethod: aString)
		do: [ :each | each acceptTextBuffer: textBuffer ].

]

{ #category : #building }
GtkCodeAdapter >> setText: aString to: gtkWidget [

	super setText: aString to: gtkWidget.
	self userActionDo: [ :action | action registerChange ]
]

{ #category : #private }
GtkCodeAdapter >> textWithStyle [

	^ self innerWidget textBuffer asText
]

{ #category : #'private-shout' }
GtkCodeAdapter >> updateCompletionProvider [	
	
	completionProvider ifNotNil: [ :p | 
		p completionEngine completionClass: self behavior ]
]

{ #category : #private }
GtkCodeAdapter >> userActionDo: aBlock [

	userAction ifNil: [ ^ self ].
	aBlock value: userAction
]

{ #category : #api }
GtkCodeAdapter >> userActionDuring: aBlock [

	userAction := GtkCodeUserAction new.
	self innerWidgetDo: [ :w |
		w textBuffer 
			disconnect: GChangedCallback signalName 
			during: [ 
				w textBuffer userActionDuring: aBlock.
				userAction hasChanged ifTrue: [
					userAction := nil.
					self applyFullStyleTo: w textBuffer ] ] ].
]

{ #category : #building }
GtkCodeAdapter >> widgetClass [

	^ GtkSourceViewLibrary uniqueInstance isAvailable 
		ifTrue: [ GtkSourceView ]
		ifFalse: [ super widgetClass ]
]
