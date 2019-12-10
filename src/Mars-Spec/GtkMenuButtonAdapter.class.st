Class {
	#name : #GtkMenuButtonAdapter,
	#superclass : #GtkBaseButtonAdapter,
	#instVars : [
		'menuWidget'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkMenuButtonAdapter >> addModelTo: gtkButton [

	super addModelTo: gtkButton.
	gtkButton 
		connect: 'button-press-event'
		signature: #(gboolean (void *widget, void *event, void *data))
		do: [ :w :event :data | 
			| widgetGravity menuGravity |
			self updateMenu.
			widgetGravity := GdkGravity GDK_GRAVITY_SOUTH_WEST.
			menuGravity := GdkGravity GDK_GRAVITY_NORTH_WEST.
			(GtkMenuButton fromHandle: w) menuPopup: menuWidget widgetGravity: widgetGravity menuGravity: menuGravity. 
			false ]
	
]

{ #category : #building }
GtkMenuButtonAdapter >> buildMenu: menuPresenter [

	menuPresenter owner: self presenter.
	menuWidget := SpBindings
		value: self presenter application adapterBindings
		during: [ menuPresenter buildWithSpec ].
	^ menuWidget
]

{ #category : #updating }
GtkMenuButtonAdapter >> updateMenu [

	self presenter menu ifNotNil: [ :aValuable |
		aValuable value ifNotNil: [ :aMenu |
			self widgetDo: [ :w | w popUp: (self buildMenu: aMenu) showAll ] ] ]
]

{ #category : #building }
GtkMenuButtonAdapter >> widgetClass [

	^ GtkMenuButton
]
