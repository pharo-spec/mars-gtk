Class {
	#name : #GtkMenuItemAdapter,
	#superclass : #GtkMenuBaseAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #'as yet unclassified' }
GtkMenuItemAdapter class >> defaultSpacing [

	^ 5
]

{ #category : #building }
GtkMenuItemAdapter >> addModelTo: gtkWidget [

	"label (and icon if there)"
	self model icon 
		ifNotNil: [ gtkWidget add: (self menuLabelWithIconAndAccelFor: gtkWidget) ]
		ifNil: [ 	gtkWidget label: self model name ].
	
	"accel"
	self model shortcut ifNotNil: [ :shortcut | 
		self flag: #HACK. "this is to ensure is not a key combination (gtk does not allows them)"
		shortcut currentCharacter asString ifNotEmpty: [ 
			gtkWidget 
				addAccelerator: 'activate' 
				group: self shortcutGroup 
				shortcut: shortcut ] ].
	
	gtkWidget sensitive: self model enabled.
	
	"action"		
	self model action ifNotNil: [ :actionBlock |
		gtkWidget connectActivate: actionBlock ].
	
	"submenu"
	self model subMenu ifNotNil: [ :menuPresenter |
		gtkWidget submenu: menuPresenter buildWithSpec ]
]

{ #category : #accessing }
GtkMenuItemAdapter >> gtkClass [

	^ GtkMenuItem
]

{ #category : #building }
GtkMenuItemAdapter >> menuLabelWithIconAndAccelFor: gtkWidget [
	| gtkBox |
	
	gtkBox := (GtkBox newHorizontalSpacing: self class defaultSpacing)
		packStart: (GtkImage newForm: (self model icon)) 
			expand: false 
			fill: false 
			padding: 0;
		packStart: (GtkLabel newLabel: self model name);
		yourself.
		
	self model shortcut ifNotNil: [ :shortcut |
		self flag: #HACK. "this is to ensure is not a key combination (gtk does not allows them)"
		shortcut currentCharacter asString ifNotEmpty: [ 
			gtkBox 
				packEnd: (GtkAccelLabel newLabel: shortcut asString) 
				expand: false 
				fill: false 
				padding: 0 ] ].
		
	^ gtkBox
]

{ #category : #building }
GtkMenuItemAdapter >> shortcutGroup [ 
	| root |
	
	root := self model root.
	^ root shortcutGroup ifNil: [ | group |
		group := GtkAccelGroup new.
		root shortcutGroup: group.
		group ]
]
