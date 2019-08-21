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

{ #category : #private }
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

	super addModelTo: gtkWindow.
	gtkWindow connectHide: [ 
		self announceClosed ]
]

{ #category : #accessing }
GtkWindowAdapter >> addPresenterIn: gtkWindow withSpecLayout: aSpec [
	| gtkBox |
	self addModelTo: gtkWindow.

	"window properties"
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

	self widgetDo: [ :w | w hide ]
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
