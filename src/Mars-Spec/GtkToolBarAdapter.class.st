Class {
	#name : #GtkToolBarAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolBarAdapter >> addModelTo: gtkToolBar [
	| needsSeparator |

	self model isDisplayModeIcons ifTrue: [ gtkToolBar beIcons ].
	self model isDisplayModeText ifTrue: [ gtkToolBar beText ].
	self model isDisplayModeBoth ifTrue: [ gtkToolBar beBoth ].

	needsSeparator := false.
	self model items 
		at: ToolBarItemPosition left 
		ifPresent: [ :items |
			items do: [ :each |  gtkToolBar add: each buildWithSpec ].
			needsSeparator := true ].
	self model items 
		at: ToolBarItemPosition right 
		ifPresent: [ :items |
			needsSeparator ifTrue: [ 
				gtkToolBar add: GtkSeparatorToolItem new ]. 
			items reverseDo: [ :each |
				gtkToolBar add: each buildWithSpec ] ]
]

{ #category : #building }
GtkToolBarAdapter >> widgetClass [

	^ GtkToolbar
]
