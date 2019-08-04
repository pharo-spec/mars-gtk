Class {
	#name : #GtkToolBarAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolBarAdapter >> addModelTo: gtkToolBar [

	super addModelTo: gtkToolBar.

	self model isDisplayModeIcons ifTrue: [ gtkToolBar beIcons ].
	self model isDisplayModeText ifTrue: [ gtkToolBar beText ].
	self model isDisplayModeBoth ifTrue: [ gtkToolBar beBoth ].

	self model leftItems do: [ :each |
		gtkToolBar add: each buildWithSpec ].
	self model rightItems do: [ :each |
		self model leftItems ifNotEmpty: [ 
			gtkToolBar add: (GtkSeparatorToolItem new show; yourself) ]. 
		gtkToolBar add: each buildWithSpec ]
]

{ #category : #building }
GtkToolBarAdapter >> widgetClass [

	^ GtkToolbar
]
