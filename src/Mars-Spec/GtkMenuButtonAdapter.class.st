Class {
	#name : #GtkMenuButtonAdapter,
	#superclass : #GtkBaseButtonAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkMenuButtonAdapter >> addModelTo: gtkButton [

	super addModelTo: gtkButton.
	self presenter menu ifNotNil: [ self updateMenu ].
	self presenter whenMenuChangedDo: [ self updateMenu ].
	

]

{ #category : #building }
GtkMenuButtonAdapter >> buildMenu [
	| menuPresenter |

	menuPresenter := self presenter menu.
	menuPresenter ifNil: [ ^ nil ].
	^ SpBindings
		value: self presenter application adapterBindings
		during: [ menuPresenter buildWithSpec ]
]

{ #category : #updating }
GtkMenuButtonAdapter >> updateMenu [

	self widget popUp: self buildMenu
]

{ #category : #building }
GtkMenuButtonAdapter >> widgetClass [

	^ GtkMenuButton
]
