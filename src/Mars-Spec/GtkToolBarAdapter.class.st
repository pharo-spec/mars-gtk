Class {
	#name : #GtkToolBarAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkToolBarAdapter >> addModelTo: gtkToolBar [
	| needsSeparator |

	self flag: #TODO. "This needs to come from the presenter"
	gtkToolBar beBoth.

	needsSeparator := false.
	self model items 
		at: ITItemPosition left 
		ifPresent: [ :items |
			items do: [ :each |  gtkToolBar add: each buildWithSpec ].
			needsSeparator := true ].
	self model items 
		at: ITItemPosition right 
		ifPresent: [ :items |
			needsSeparator ifTrue: [ 
				gtkToolBar add: GtkSeparatorToolItem new ]. 
			items reverseDo: [ :each |
				gtkToolBar add: each buildWithSpec ] ]
]

{ #category : #building }
GtkToolBarAdapter >> buildWidget [
	| gtkToolBar |

	gtkToolBar := GtkToolbar new.
	self addModelTo: gtkToolBar.
	
	^ gtkToolBar 
]
