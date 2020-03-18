Class {
	#name : #GtkToolBarBaseButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolBarBaseButtonAdapter >> addModelTo: gtkToolButton [
	
	"Show all to ensure icons are shown if they are not"
	gtkToolButton showAll.
	
	gtkToolButton tooltipText: self presenter help.
	
	self presenter 
		whenLabelChangedDo: [ self updateLabel ];
		whenIconChangedDo: [ self updateIcon ].
	

]

{ #category : #accessing }
GtkToolBarBaseButtonAdapter >> icon [ 

	^ self presenter icon
		ifNotNil: [ :icon | icon asGtkImage ]
		ifNil: [ GtkImage null ]
]

{ #category : #updating }
GtkToolBarBaseButtonAdapter >> updateIcon [ 

	self widgetDo: [ :w |
		w iconWidget: self icon ]
]

{ #category : #updating }
GtkToolBarBaseButtonAdapter >> updateLabel [ 

	self widgetDo: [ :w |
		w label: self presenter label ]
]
