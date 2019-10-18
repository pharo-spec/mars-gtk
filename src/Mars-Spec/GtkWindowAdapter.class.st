Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'infoArea'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkWindowAdapter >> add: gtkBox toWindow: gtkWindow [

	gtkWindow add: gtkBox
]

{ #category : #'private building' }
GtkWindowAdapter >> addDefaultKeyBindings: gtkWindow [
	
	self flag: #TODO. "In fact, this thingy needs to came from a configuration. Here is just 
	hardcoded crap."
	self 
		bindKeyCombination: $w command mac | $w control win | $w control unix 
		toAction: [ self closeFromKeyboard ]
]

{ #category : #'private building' }
GtkWindowAdapter >> addMenuTo: gtkBox window: gtkWindow [
	| gtkMenuBar |
	
	gtkMenuBar := self model menu buildWithSpec.
	gtkBox 
		packStart: gtkMenuBar 
		expand: false 
		fill: false 
		padding: 0.

	self model menu shortcutGroup ifNotNil: [ :accelGroup | 
		gtkWindow addAcceleratorGroup: accelGroup ]
]

{ #category : #building }
GtkWindowAdapter >> addModelTo: gtkWindow [
	"model is not added here but in #addPresenterIn:withSpecLayout:. 
	 Spec windows may have just ONE presenter"
]

{ #category : #accessing }
GtkWindowAdapter >> addPresenterIn: gtkWindow withSpecLayout: aSpec [
	| gtkBox |

	self connectToGtkSignals: gtkWindow.
	self addDefaultKeyBindings: gtkWindow.

	"add window properties"
	self model initialExtent
		ifNotNil: [ :extent | gtkWindow resize: extent ].
	self model initialPosition
		ifNotNil: [ :position | gtkWindow moveTo: position ].

	"inner contents of window"
	gtkBox := GtkBox newVertical.
	gtkBox show.
	"menu bar"
	self model hasMenu
		ifTrue: [ self addMenuTo: gtkBox window: gtkWindow ].
	"tool bar"
	self model hasToolbar
		ifTrue: [ self addToolBarTo: gtkBox ].
	"infoArea"
	gtkBox
		packStart: (infoArea := GtkInfoArea new)
		expand: false
		fill: false
		padding: 0.
	"contents"
	gtkBox packStart: (self contentWidget: aSpec).
	"status bar"
	self model hasStatusBar
		ifTrue: [ self addStatusBarTo: gtkBox ].
	"... and add all that to window"
	self add: gtkBox toWindow: gtkWindow
]

{ #category : #private }
GtkWindowAdapter >> addStatusBarTo: gtkBox [
	| gtkStatusBar |
	
	gtkStatusBar := self model statusBar buildWithSpec.
	gtkBox 
		packStart: gtkStatusBar 
		expand: false 
		fill: false 
		padding: 0	
]

{ #category : #private }
GtkWindowAdapter >> addToolBarTo: gtkBox [
	| gtkToolBar |
	
	gtkToolBar := self model toolBar buildWithSpec.
	gtkBox 
		packStart: gtkToolBar 
		expand: false 
		fill: false 
		padding: 0
]

{ #category : #private }
GtkWindowAdapter >> announceClosed [

	self model windowIsClosing
]

{ #category : #private }
GtkWindowAdapter >> announceOpened [

	self model windowIsOpening
]

{ #category : #private }
GtkWindowAdapter >> announceResized: aPoint [

	self presenter announcer announce: (WindowResizing new
		window: self presenter;
		newSize: aPoint;	
		yourself)	
]

{ #category : #private }
GtkWindowAdapter >> announceWillClose [

	self presenter announcer announce: (SpWindowWillClose new
		window: self presenter;
		yourself)
]

{ #category : #accessing }
GtkWindowAdapter >> centered [
	
	self widgetDo: [ :w | 
		w isVisible 
			ifTrue: [ w moveToCenter ]
			ifFalse: [ w center ] ]
]

{ #category : #accessing }
GtkWindowAdapter >> centeredRelativeTo: aWindowPresenter [ 
	| bounds position |	

	bounds := aWindowPresenter adapter widget bounds.
	position := bounds topLeft + ((bounds extent - self widget size) // 2).
	self widget moveTo: position		
]

{ #category : #accessing }
GtkWindowAdapter >> close [

	self widgetDo: [ :w | 
		w hide. 
		w isAlive ifTrue: [ w destroy ] ]
]

{ #category : #accessing }
GtkWindowAdapter >> closeFromKeyboard [

	self announceWillClose.
	self close
]

{ #category : #'private building' }
GtkWindowAdapter >> connectToGtkSignals: gtkWindow [

	"add close events (delete is sent before)"
	gtkWindow 
		connectDeleteEvent: [ self announceWillClose. false ];
		connectHide: [ self announceClosed ];
		connectSizeAllocate: [ :aRect | self announceResized: aRect extent ]
]

{ #category : #private }
GtkWindowAdapter >> contentWidget: aSpec [

	^ self model presenter buildWithSpecLayout: aSpec
]

{ #category : #building }
GtkWindowAdapter >> newWidget [

	^ GtkWindow new 
		autoRelease;
		yourself
]

{ #category : #notifying }
GtkWindowAdapter >> notifyError: aSpecNotification [

	infoArea addError: aSpecNotification message
]

{ #category : #notifying }
GtkWindowAdapter >> notifyInfo: aSpecNotification [

	infoArea addInfo: aSpecNotification message
]

{ #category : #accessing }
GtkWindowAdapter >> open [

	self widgetDo: [ :w | 
		w show.
		w present.
		self announceOpened ].
]

{ #category : #accessing }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
