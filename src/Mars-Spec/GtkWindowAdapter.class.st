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
		
	gtkBox := GtkBox newVertical.
			
	self model hasMenu ifTrue: [ self addMenuTo: gtkBox window: gtkWindow ].
	self model hasToolBar ifTrue: [ self addToolBarTo: gtkBox ].
	
	gtkBox packStart: (self contentWidget: aSpec).

	self model hasStatusBar ifTrue: [ self addStatusBarTo: gtkBox ].
	
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

{ #category : #building }
GtkWindowAdapter >> buildWidget [

	^ GtkWindow new 
		autoRelease
		resize: self model initialExtent;
		yourself
]

{ #category : #accessing }
GtkWindowAdapter >> centered [
	
	self widgetDo: [ :w | 
		w 
			hide; 
			center; 
			showAll ]
]

{ #category : #private }
GtkWindowAdapter >> contentWidget: aSpec [

	^ self model presenter buildWithSpecLayout: aSpec
]

{ #category : #accessing }
GtkWindowAdapter >> open [

	self widgetDo: [ :w | w showAll ]
]

{ #category : #accessing }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
