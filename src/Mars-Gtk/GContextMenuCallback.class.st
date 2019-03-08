"
A callback that hangs from secondary button but is used to handle context menus
"
Class {
	#name : #GContextMenuCallback,
	#superclass : #GSecondaryButtonPressEventCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #connecting }
GContextMenuCallback >> connectTo: aWidget [

	self disconnectOtherLikeMeFrom: aWidget.
	super connectTo: aWidget
]

{ #category : #connecting }
GContextMenuCallback >> disconnectOtherLikeMeFrom: aWidget [

	self flag: #TODO. "match for class? :("
	aWidget callback 
		detect: [ :each | each class = self class ]
		ifFound: [ :each | each disconnectFrom: aWidget ]
]
