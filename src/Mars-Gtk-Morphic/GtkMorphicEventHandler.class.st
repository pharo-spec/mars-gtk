"
I'm used to convert Gtk events into Morphic events to be passed to GtkMorphView instances.
"
Class {
	#name : #GtkMorphicEventHandler,
	#superclass : #OSWindowMorphicEventHandler,
	#pools : [
		'GdkKeyCodes'
	],
	#classInstVars : [
		'symbolCharacterMapping'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'as yet unclassified' }
GtkMorphicEventHandler class >> createSymbolCharacterMapping [
	| mapping |

	mapping := Dictionary new.
	{
		KEY_Escape. Character escape.
	 	KEY_Return . Character cr.
	  	KEY_BackSpace . Character backspace.
	 	KEY_Tab . Character tab.
	 	KEY_Home . Character home.
	 	KEY_Left . Character arrowLeft.
	 	KEY_Up . Character arrowUp.
	 	KEY_Right . Character arrowRight.
	 	KEY_Down . Character arrowDown.
	 	KEY_End . Character end.
	 	KEY_Insert . Character insert.
	 	KEY_Page_Up . Character pageUp.
	 	KEY_Page_Down . Character pageDown.
	 	KEY_Delete. Character delete.
		
		"OSK_KP_0 . $0.
	 	OSK_KP_1 . $1.
	 	OSK_KP_2 . $2.
	 	OSK_KP_3 . $3.
	 	OSK_KP_4 . $4.
	 	OSK_KP_5 . $5.
	 	OSK_KP_6 . $6.
	 	OSK_KP_7 . $7.
	 	OSK_KP_8 . $8.
	 	OSK_KP_9 . $9.
	 	OSK_KP_DIVIDE . $/.
	 	OSK_KP_MULTIPLY . $*.
	 	OSK_KP_PLUS . $+.
	 	OSK_KP_MINUS . $-.
	 	OSK_KP_ENTER . Character cr.
	 	OSK_KP_PERIOD . $. "
	} pairsDo: [ :key :val | mapping at: key put: val charCode ].
	
	^ mapping
]

{ #category : #'as yet unclassified' }
GtkMorphicEventHandler class >> symbolCharacterMapping [

	^ symbolCharacterMapping ifNil: [ symbolCharacterMapping := self createSymbolCharacterMapping ]
]

{ #category : #'as yet unclassified' }
GtkMorphicEventHandler class >> symbolCharacterMappingAt: aKey ifAbsent: aBlock [

	^ self symbolCharacterMapping 
		at: aKey
		ifAbsent: aBlock
]

{ #category : #converting }
GtkMorphicEventHandler >> convertModifiers: anEvent [
	| modifiers button |

	modifiers := 0.
	
	"Alt/Option key"
	anEvent hasAltModifier ifTrue: [
		"On windows and unix, treat alt key as command key"
		modifiers := Smalltalk os isWin32 | Smalltalk os isUnix
			ifTrue: [ modifiers | 2r01000000 ]
			ifFalse: [ modifiers | 2r00100000 ] ]. 
	
	anEvent hasControlModifier ifTrue: [ modifiers := modifiers | 2r00010000 ]. "Control key"
	anEvent hasShiftModifier ifTrue: [ modifiers := modifiers | 8 ]. "Shift key"
	anEvent hasMod2 ifTrue: [ modifiers := modifiers | 2r01000000 ]. "Cmd key"
	
	button := anEvent button.
	(button ~= 1 and: [ anEvent hasButton1Modifier ]) 
		ifTrue: [ modifiers := modifiers | MouseButtonEvent redButton ].
	(button ~= 2 and: [ anEvent hasButton2Modifier ]) 
		ifTrue: [ modifiers := modifiers | MouseButtonEvent blueButton ].
	(button ~= 3 and: [ anEvent hasButton3Modifier ]) 
		ifTrue: [ modifiers := modifiers | MouseButtonEvent yellowButton ].

	^ modifiers
]

{ #category : #events }
GtkMorphicEventHandler >> dispatchMorphicEvent: anEvent [

	self processEventQueue.
	super dispatchMorphicEvent: anEvent
]

{ #category : #events }
GtkMorphicEventHandler >> evaluateUserInterrupt: anEvent [

	(anEvent isEventKey
		and: [ anEvent isKeyPress
				and: [ anEvent hasAnyModifier and: [ anEvent keyCharacter = $. ] ] ])
		ifTrue: [ UserInterruptHandler new handleUserInterrupt ]
]

{ #category : #events }
GtkMorphicEventHandler >> handleEvent: anEvent [
	"convert the event to morphic one, and dispatch it whatever..."
	| morphicEvent |
	
	morphicEvent := anEvent accept: self.
	morphicEvent isMorphicEvent ifFalse: [ ^ false ].

	self evaluateUserInterrupt: anEvent.
	
	self dispatchMorphicEvent: morphicEvent.

	^ morphicEvent wasHandled
]

{ #category : #converting }
GtkMorphicEventHandler >> mapSymbolToKeyValue: symbol [

	^ self class 
		symbolCharacterMappingAt: symbol 
		ifAbsent: [ 
			symbol = KEY_VoidSymbol
				ifTrue: [ nil ]
				ifFalse: [ symbol ] ]
]

{ #category : #events }
GtkMorphicEventHandler >> processEventQueue [
	| event |

	self eventQueue isEmpty ifTrue: [ ^ self ].

	[ (event := self eventQueue nextOrNil) notNil ] 
	whileTrue: [ super dispatchMorphicEvent: event ]
]

{ #category : #visiting }
GtkMorphicEventHandler >> visitKeyDownEvent: anEvent [
	| keyDownEvent keyStrokeEvent modifiers keyValue |

	modifiers := self convertModifiers: anEvent modifiers.
	keyValue := self mapSymbolToKeyValue: anEvent symbol.
	keyDownEvent := KeyboardEvent new
		setType: #keyDown
		buttons: modifiers
		position: anEvent position
		keyValue: keyValue
		charCode: keyValue
		hand:  self activeHand
		stamp: Time millisecondClockValue.
	keyDownEvent scanCode: anEvent scanCode.
	self enqueue: keyDownEvent.
	
	"This is for ctrl/alt held alone makes morphic think that null character is good text input"
	keyDownEvent keyValue = 0 ifTrue: [ ^ self ].
	
	"That's stupid and horrible, but that's the way we doing it for now"
	keyDownEvent keyValue = 27 "Esc" ifFalse: [
		anEvent character ifNil: [ 
			(modifiers alt or: [ modifiers ctrl or: [ modifiers cmd ] ]) ifFalse: [ 
				^ nil ] ] ].
		
	"Workaround for SDL<->Morphic: produce keystroke events
	if any modifier key held down (for non-modified keys there are OSTextInputEvent)"
	keyStrokeEvent := KeyboardEvent new
		setType: #keystroke
		buttons: modifiers
		position: anEvent position
		keyValue: keyValue
		charCode: keyValue
		hand:  morphicWorld activeHand
		stamp: Time millisecondClockValue.
	keyStrokeEvent scanCode: anEvent scanCode.
	
	^ keyStrokeEvent
]

{ #category : #visiting }
GtkMorphicEventHandler >> visitMouseButtonPressEvent: anEvent [

	"Gtk will inform a double click AND a simple click. 
	 This is of course better, but morphic is more low level than that and will interpret double 
	 click from two single clicks. 
	 In order to make the world work properly, I need to let morphic do its interpretation (even 
	 if is worst)"
	anEvent isDoubleClick ifTrue: [ ^ nil ].
	^ super visitMouseButtonPressEvent: anEvent.
]

{ #category : #visiting }
GtkMorphicEventHandler >> visitUnknownEvent: anEvent [

	"anEvent type crLog."
	^ nil
]
