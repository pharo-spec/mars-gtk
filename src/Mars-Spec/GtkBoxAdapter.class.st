Class {
	#name : #GtkBoxAdapter,
	#superclass : #GtkLayoutAdapter,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #private }
GtkBoxAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
	
	constraints isExpand ifFalse: [
		| min |
		min := childWidget preferredSizeMinimum.
		constraints width ifNotNil: [ :w | 
			childWidget sizeRequest: w@min y ].
		constraints height ifNotNil: [ :h | 
			childWidget sizeRequest: min x@h ] ].

	^ childWidget
]

{ #category : #private }
GtkBoxAdapter >> basicAdd: aPresenter constraints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
	self addConstraits: constraints toChild: childWidget.
	constraints isPlacedAtStart
		ifTrue: [ 
			gtkWidget 
				packStart: childWidget 
				expand: constraints isExpand 
				fill: constraints isFill
				padding: constraints padding ]
		ifFalse: [ 
			gtkWidget 
				packEnd: childWidget 
				expand: constraints isExpand 
				fill: constraints isFill 
				padding: constraints padding ].
			
	^ gtkWidget
]

{ #category : #building }
GtkBoxAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #testing }
GtkBoxAdapter >> childrenWidgets [
	
	^ self widget children
]

{ #category : #private }
GtkBoxAdapter >> doLayout: aLayout [

	"build of widget was differed up to here (to know what is the direction)"
	widget := aLayout direction newWidgetOn: self.

	model whenVisibleChangedDo: [ 	
		model isVisible 
			ifTrue: [ widget show ] 
			ifFalse: [ widget hide ]].

	widget 
		homogeneous: aLayout isHomogeneous;
		spacing: aLayout spacing;
		borderWidth: aLayout borderWidth.
		
	model isVisible 
		ifTrue: [ widget show ] 
		ifFalse: [ widget hide ].
	
]

{ #category : #factory }
GtkBoxAdapter >> newHorizontal [

	^ GtkBox newHorizontal
]

{ #category : #factory }
GtkBoxAdapter >> newVertical [

	^ GtkBox newVertical
]

{ #category : #'accessing - children' }
GtkBoxAdapter >> remove: aPresenter [

	^ self widgetDo: [ :w | 
		w remove: aPresenter adapter widget ]
]

{ #category : #'accessing - children' }
GtkBoxAdapter >> removeAll [

	self widgetDo: #removeAll
]
