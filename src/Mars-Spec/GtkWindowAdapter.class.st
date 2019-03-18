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
	gtkWindow resize: self model initialExtent.

	"inner contents of window"	
	gtkBox := GtkBox newVertical.
	gtkBox show.
	"menu bar"
	self model hasMenu ifTrue: [ self addMenuTo: gtkBox window: gtkWindow ].
	"tool bar"
	self model hasToolBar ifTrue: [ self addToolBarTo: gtkBox ].
	"infoArea"
	gtkBox packStart: (infoArea := GtkBox newVertical) expand: false fill: false padding: 0. 
	"contents"
	gtkBox packStart: (self contentWidget: aSpec).
	"status bar"
	self model hasStatusBar ifTrue: [ self addStatusBarTo: gtkBox ].
	"... and add all that to window"
	self add: gtkBox toWindow: gtkWindow.
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

{ #category : #accessing }
GtkWindowAdapter >> centered [
	
	self widgetDo: [ :w | 
		w isVisible 
			ifFalse: [ 
				w center ]
			ifTrue: [ 
				w hide; center; show ] ]
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

{ #category : #'private notifying' }
GtkWindowAdapter >> notify: aString withBar: aBlock [
	| gtkInfoBar |
	
	gtkInfoBar := GtkInfoBar new.
	aBlock value: gtkInfoBar.

	gtkInfoBar
		showCloseButton;
		connectResponse: [ :responseId |
			gtkInfoBar hide.
			self flag: #TODO. "I'm not sure I can do this, but seems correct to not leak"
			infoArea remove: gtkInfoBar ].
		
	gtkInfoBar contentArea 
		packStart: (GtkLabel newLabel: aString)
		expand: false 
		fill: false 
		padding: 0.
		
	infoArea
		packStart: gtkInfoBar expand: false fill: false padding: 0;
		showAll.
	
]

{ #category : #notifying }
GtkWindowAdapter >> notifyError: aSpecNotification [

	self 
		notify: aSpecNotification message 
		withBar: #beError	
]

{ #category : #notifying }
GtkWindowAdapter >> notifyInfo: aSpecNotification [

	self 
		notify: aSpecNotification message
		withBar: #beInfo
]

{ #category : #accessing }
GtkWindowAdapter >> open [

	self widgetDo: [ :w | w show ]
]

{ #category : #accessing }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
