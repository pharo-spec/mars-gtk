Class {
	#name : #GtkMenuItemAdapter,
	#superclass : #GtkMenuBaseAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkMenuItemAdapter class >> defaultSpacing [

	^ 5
]

{ #category : #private }
GtkMenuItemAdapter >> addAcceleratorShortcut: shortcut to: gtkWidget [
	
	self flag: #HACK.	"this is to ensure is not a key combination (gtk does not allows them)"
	shortcut currentCharacter asString ifEmpty: [ ^ self ].

	gtkWidget
		addAccelerator: 'activate'
		group: self shortcutGroup
		shortcut: shortcut
]

{ #category : #private }
GtkMenuItemAdapter >> addAcceleratorShortcutLabel: shortcut to: gtkBox [
	
	self flag: #HACK. "this is to ensure is not a key combination (gtk does not allows them)"
	shortcut currentCharacter asString ifEmpty: [ ^ self ].
	
	gtkBox 
		packEnd: (GtkAccelLabel newAccelerator: shortcut)
		expand: false 
		fill: false
		padding: 0
]

{ #category : #building }
GtkMenuItemAdapter >> addModelTo: gtkWidget [
	"label (and icon if there)"

	self presenter icon
		ifNotNil: [ gtkWidget add: (self menuLabelWithIconAndAccelFor: gtkWidget) ]
		ifNil: [ gtkWidget label: self presenter name ].
	"accel"
	self presenter shortcut ifNotNil: [ :shortcut | 
		self addAcceleratorShortcut: shortcut to: gtkWidget ].
	"enabled?"
	gtkWidget sensitive: self presenter isEnabled value.

	"action"
	self presenter action ifNotNil: [ :actionBlock |
		gtkWidget connectActivate: actionBlock ].

	"submenu"
	self presenter subMenu
		ifNotNil: [ :menuPresenter | gtkWidget submenu: menuPresenter buildWithSpec ]
]

{ #category : #'as yet unclassified' }
GtkMenuItemAdapter >> getNameText [

	^ self presenter name ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #building }
GtkMenuItemAdapter >> menuLabelWithIconAndAccelFor: gtkWidget [
	| gtkBox |
	
	gtkBox := (GtkBox newHorizontalSpacing: self class defaultSpacing)
		packStart: (self model icon value ifNil: [self iconNamed: #blank]) asGtkImage
			expand: false 
			fill: false 
			padding: 0;
		packStart: (GtkLabel newLabel: self getNameText);
		yourself.
		
	self model shortcut ifNotNil: [ :shortcut |
		self addAcceleratorShortcutLabel: shortcut to: gtkBox ].
		
	gtkBox showAll.

	^ gtkBox
]

{ #category : #private }
GtkMenuItemAdapter >> shortcutGroup [ 
	| root |
	
	root := self model rootMenu.
	^ root shortcutGroup ifNil: [ | group |
		group := GtkAccelGroup new.
		root shortcutGroup: group.
		group ]
]

{ #category : #accessing }
GtkMenuItemAdapter >> widgetClass [

	^ GtkMenuItem
]
