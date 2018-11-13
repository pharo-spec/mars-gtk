Class {
	#name : #GtkDialogWindowAdapter,
	#superclass : #GtkWindowAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkDialogWindowAdapter >> add: gtkBox toWindow: gtkWindow [

	"if this is a gtkWindow, this is the right thing to add"
	"gtkWindow contentArea packStart: gtkBox.
	self model buttons
		keysAndValuesDo: [ :label :action |
			gtkWindow addButton: label do: action ].
	gtkWindow defaultResponse: self model buttons size."

	gtkWindow add: (GtkBox newVertical
		packStart: gtkBox;
		packEnd: self newButtonBox 
			expand: false 
			fill: false 
			padding: 0;
		yourself)
]

{ #category : #accessing }
GtkDialogWindowAdapter >> addModelIn: gtkWindow withSpecLayout: aSpec [

	self model isCentered 
		ifTrue: [ gtkWindow center ].
	super addModelIn: gtkWindow withSpecLayout: aSpec	
]

{ #category : #building }
GtkDialogWindowAdapter >> buildWidget [

	^ super buildWidget 
		beModal;
		yourself
]

{ #category : #private }
GtkDialogWindowAdapter >> contentWidget: aSpec [

	^ self model contents
]

{ #category : #private }
GtkDialogWindowAdapter >> newButtonBox [ 
	| buttonBox |

	buttonBox := GtkButtonBox newHorizontal 
		placeAtEnd;
		spacing: 5;
		yourself.	
	self model buttons
		keysAndValuesDo: [ :label :action |
			buttonBox packStart: (ButtonPresenter new 
				label: label;
				action: action;
				buildWithSpec) ].

	^ buttonBox
]

{ #category : #accessing }
GtkDialogWindowAdapter >> open [ 

	super open.
	"self widgetDo: [ :w | w run ]"
]
