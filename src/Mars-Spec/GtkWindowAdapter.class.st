Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'infoArea',
		'initialized',
		'deferredActions'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkWindowAdapter >> add: gtkBox toWindow: gtkWindow [

	gtkWindow add: gtkBox
]

{ #category : #'private building' }
GtkWindowAdapter >> addDefaultKeyBindings: gtkWindow [
	
	self flag: #TODO. "In fact, this thingy needs to came from a configuration. 
	Here is just hardcoded crap."
	self 
		bindKeyCombination: $w command mac | $w control win | $w control unix 
		toAction: [ self closeFromKeyboard ]
]

{ #category : #'private deferring' }
GtkWindowAdapter >> addDeferredAction: aBlock [

	deferredActions ifNil: [ deferredActions := #() ].
	deferredActions := deferredActions copyWith: aBlock
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
	
	initialized := false.
	GtkRunLoop defer: [ 
		self deferredAddPresenterIn: gtkWindow withSpecLayout: aSpec.
		initialized := true.
		self processDeferredActions ]
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
GtkWindowAdapter >> beep [

	self widgetDo: [ :w | w beep ].
]

{ #category : #accessing }
GtkWindowAdapter >> centered [
	
	self deferAction: [ 
		self widgetDo: [ :w | 
			w isVisible 
				ifTrue: [ w hide; center; show ]
				ifFalse: [ w center ] ] ]
]

{ #category : #accessing }
GtkWindowAdapter >> centeredRelativeTo: aWindowPresenter [
	| bounds position |	

	self deferAction: [
		self widgetDo: [ :w | | isVisible |
			isVisible := w isVisible.
			isVisible ifTrue:[ w hide ].
			bounds := aWindowPresenter adapter widget bounds.
			position := bounds topLeft + ((bounds extent - w size) // 2).
			w moveTo: position.
			isVisible ifTrue:[ w show ] ] ]
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
	self presenter close
]

{ #category : #private }
GtkWindowAdapter >> configureKeyBindings: gtkWindow [
		
	dispatcher := GtkKMDispatcher on: self presenter.
	gtkWindow connectKeyPressEvent: [ :event |
		(self handleKeyEvent: event)
			ifTrue: [ true ]
			ifFalse: [ gtkWindow propagateKeyEvent: event ] ].
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

{ #category : #'private deferring' }
GtkWindowAdapter >> deferAction: aBlock [ 

	initialized
		ifTrue: [ aBlock value ]
		ifFalse: [ self addDeferredAction: aBlock ]
]

{ #category : #private }
GtkWindowAdapter >> deferredAddPresenterIn: gtkWindow withSpecLayout: aSpec [
	| gtkBox |

	self connectToGtkSignals: gtkWindow.
	self addDefaultKeyBindings: gtkWindow.

	"add window properties"
	self model initialExtent
		ifNotNil: [ :extent |
			gtkWindow 
				defaultSize: extent;
				resize: extent ].
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

{ #category : #accessing }
GtkWindowAdapter >> delete [

	self widgetDo: [ :w | 
		w delete. 
		self presenter application windowClosed: self ]
]

{ #category : #testing }
GtkWindowAdapter >> initialize [

	initialized := false.
	super initialize
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
		GtkRunLoop defer: [ 
			w show.
			w present ].
		self announceOpened ].
]

{ #category : #'private deferring' }
GtkWindowAdapter >> processDeferredActions [

	deferredActions ifNil: [ ^ self ].
	deferredActions do: #value.
	deferredActions := nil
]

{ #category : #accessing }
GtkWindowAdapter >> title: aString [ 

	self widgetDo: [ :w | w title: aString ]
]
