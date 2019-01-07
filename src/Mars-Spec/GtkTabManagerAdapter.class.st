Class {
	#name : #GtkTabManagerAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkTabManagerAdapter >> addModelTo: gtkWidget [

	self model tabs do: [ :each |
		gtkWidget 
			append: each retrievingBlock value 
			label: (self buildLabelForTab: each) ]
]

{ #category : #building }
GtkTabManagerAdapter >> buildLabelForTab: aTabPresenter [
	| label |

	label := GtkLabel newLabel: aTabPresenter label.
	aTabPresenter icon ifNotNil: [ :icon |
		label := GtkBox newHorizontal 
			packStart: (GtkImage newForm: icon);
			packStart: label;
			yourself  ].
	
	^ label
]

{ #category : #building }
GtkTabManagerAdapter >> widgetClass [

	^ GtkNotebook
]
