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

	self model whenItemsChangeDo: [ self updateItems: gtkToolBar ].

	self updateItems: gtkToolBar 
]

{ #category : #testing }
GtkToolBarAdapter >> hasButtonWithLabel: aString [ 
	
	^ self widget children anySatisfy: [ :e | 
		(e isKindOf: GtkToolButton) and: [ e label = aString ] ]
]

{ #category : #building }
GtkToolBarAdapter >> needsSeparator [

	^ self model leftItems isNotEmpty and: [self model rightItems isNotEmpty]
]

{ #category : #building }
GtkToolBarAdapter >> numberOfItems [

	^ self needsSeparator
		ifTrue: [ self widget size - 1 ]
		ifFalse: [ self widget size ]
]

{ #category : #building }
GtkToolBarAdapter >> updateItems: gtkToolBar [ 

	gtkToolBar removeAll.

	self model leftItems do: [ :each | gtkToolBar add: each buildWithSpec ].

	self needsSeparator ifTrue: [ 
		gtkToolBar add: (GtkSeparatorToolItem new 
			show;
			yourself) ].

	self model rightItems reverseDo: [ :each | gtkToolBar add: each buildWithSpec ]
]

{ #category : #building }
GtkToolBarAdapter >> widgetClass [

	^ GtkToolbar
]
