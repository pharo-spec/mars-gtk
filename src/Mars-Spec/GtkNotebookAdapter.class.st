Class {
	#name : #GtkNotebookAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkNotebookAdapter >> addContentPage: index to: gtkWidget [ 
	| box |

	box := gtkWidget children at: index.
	box hasChildren ifTrue: [ ^ self ].
	
	box 
		packStart: (self buildPage: (self model pageAt: index) presenter);
		showAll
]

{ #category : #building }
GtkNotebookAdapter >> addModelTo: gtkWidget [

	self model pages ifEmpty: [ ^ self ].
	self model pages do: [ :each |
		gtkWidget 
			append: GtkBox newVertical
			label: (self buildLabelForTab: each) ].
	"I add contents to fist page because this will shown anyway (and like this I allow
	 the layout to act correctly"
	self addContentPage: 1 to: gtkWidget. 
	gtkWidget connectSwitchPage: [ :index | 
		self addContentPage: index to: gtkWidget ].
]

{ #category : #building }
GtkNotebookAdapter >> buildLabelForTab: aTabPresenter [
	| label |

	label := GtkLabel newLabel: aTabPresenter title asString.
	self flag: #TODO. "I'm not sure a notebook takes anything"
	"aTabPresenter icon ifNotNil: [ :icon |
		label := GtkBox newHorizontal
			packStart: (GtkImage newForm: icon);
			packEnd: label;
			yourself ]."

	^ label
]

{ #category : #building }
GtkNotebookAdapter >> buildPage: aPresenter [

	^ SpecBindings 
	 	value: GtkAdapterBindings 
		during: [ aPresenter buildWithSpec ]

]

{ #category : #building }
GtkNotebookAdapter >> widgetClass [

	^ GtkNotebook
]
