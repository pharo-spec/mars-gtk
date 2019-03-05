Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
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

{ #category : #accessing }
GtkWindowAdapter >> addModelIn: gtkWindow withSpecLayout: aSpec [
	| gtkBox |

	"window properties"
	gtkWindow resize: self model initialExtent.

	"inner contents of window"	
	gtkBox := GtkBox newVertical.
	"menu bar"
	self model hasMenu ifTrue: [ self addMenuTo: gtkBox window: gtkWindow ].
	"tool bar"
	self model hasToolBar ifTrue: [ self addToolBarTo: gtkBox ].
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

{ #category : #accessing }
GtkWindowAdapter >> centered [
	
	self widgetDo: [ :w | 
		w isVisible 
			ifFalse: [ 
				w center ]
			ifTrue: [ 
				w hide; center; showAll ] ]
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

{ #category : #accessing }
GtkWindowAdapter >> open [

	self widgetDo: [ :w | w showAll ]
]

{ #category : #accessing }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
