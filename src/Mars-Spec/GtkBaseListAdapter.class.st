Class {
	#name : #GtkBaseListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #building }
GtkBaseListAdapter >> addMenu: aValuable to: gtkList [

	self flag: #TODO. "This maybe needs to be pushed up to generalise"	
	gtkList connectRightClicked: [ :event | 
		lastShownMenu := self buildMenu: aValuable value.
		lastShownMenu connectDestroy: [ lastShownMenu := nil ].
		lastShownMenu 
			showAll;
			popupAtPointer: event.
		true ]
]

{ #category : #building }
GtkBaseListAdapter >> addModelTo: gtkList [

	super addModelTo: gtkList.
	self model contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkList ]
]
