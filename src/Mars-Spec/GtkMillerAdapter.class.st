Class {
	#name : #GtkMillerAdapter,
	#superclass : #GtkLayoutAdapter,
	#instVars : [
		'layout'
	],
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #private }
GtkMillerAdapter >> add: aPresenter constraints: constraints [
 
	super add: aPresenter constraints: constraints.
	self recalculatePages 
]

{ #category : #private }
GtkMillerAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
	
	^ childWidget
]

{ #category : #private }
GtkMillerAdapter >> basicAdd: aPresenter constraints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
	self addConstraits: constraints toChild: childWidget.
	gtkWidget 
		packStart: childWidget 
		expand: false 
		fill: false
		padding: 0.
			
	^ gtkWidget
]

{ #category : #building }
GtkMillerAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #private }
GtkMillerAdapter >> childrenWidgets [
	
	^ self widget children
]

{ #category : #building }
GtkMillerAdapter >> layout: aLayout [

	layout := aLayout.
	
	"build of widget was differed up to here (to know what is the direction)"
	widget := layout direction newWidgetOn: self.

	model whenVisibleChangedDo: [ 	
		self toggleVisible: model isVisible ] .

	widget 
		homogeneous: true;
		spacing: aLayout spacing;
		borderWidth: aLayout borderWidth.
		
	self toggleVisible: model isVisible
]

{ #category : #factory }
GtkMillerAdapter >> newHorizontal [

	^ GtkBox newHorizontal
]

{ #category : #factory }
GtkMillerAdapter >> newVertical [

	^ GtkBox newVertical
]

{ #category : #private }
GtkMillerAdapter >> recalculatePageHeights [
	| newHeight widgets height |

	height := self widget height.
	widgets := self childrenWidgets.
	newHeight := widgets size = 1
		ifTrue: [ height ]
		ifFalse: [ height / (layout visiblePages min: widgets size) ].
		
	widgets reverseDo: [ :each |
		each sizeRequest: each width @ newHeight ]	
]

{ #category : #private }
GtkMillerAdapter >> recalculatePageWidths [
	| newWidth widgets width |

	width := self widget width.
	widgets := self childrenWidgets.
	newWidth := widgets size = 1
		ifTrue: [ width ]
		ifFalse: [ width / (layout visiblePages min: widgets size) ].
		
	widgets reverseDo: [ :each |
		each sizeRequest: newWidth @ each height ]	
]

{ #category : #private }
GtkMillerAdapter >> recalculatePages [

	self widget ifNil: [ ^ self ].
	layout direction recalculatePages: self
]

{ #category : #removing }
GtkMillerAdapter >> remove: aPresenter [

	^ self widget remove: aPresenter adapter widget
]

{ #category : #removing }
GtkMillerAdapter >> removeAll [

	self widget removeAll
]

{ #category : #private }
GtkMillerAdapter >> toggleVisible: isVisible [

	isVisible 
		ifTrue: [ widget show ] 
		ifFalse: [ widget hide ]
]
