Class {
	#name : #GtkMenuButtonAdapter,
	#superclass : #GtkBaseButtonAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkMenuButtonAdapter >> addModelTo: gtkButton [

	super addModelTo: gtkButton.
	gtkButton 
		connect: 'button-press-event'
		signature: #(gboolean (void *widget, void *event, void *data))
		do: [ :w :event :data | 
			self updateMenu.
			false ]
	
]

{ #category : #building }
GtkMenuButtonAdapter >> buildMenu: menuPresenter [

	menuPresenter owner: self presenter.
	^ SpBindings
		value: self presenter application adapterBindings
		during: [ menuPresenter buildWithSpec ]
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
