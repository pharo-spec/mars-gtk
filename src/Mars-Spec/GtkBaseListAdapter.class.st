Class {
	#name : #GtkBaseListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#traits : 'TGtkHaveWrappingScrollBars',
	#classTraits : 'TGtkHaveWrappingScrollBars classTrait',
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #building }
GtkBaseListAdapter >> addModelTo: gtkList [

	super addModelTo: gtkList.
	self model contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkList ]
]
