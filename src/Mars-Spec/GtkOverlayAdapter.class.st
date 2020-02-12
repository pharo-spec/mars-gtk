Class {
	#name : #GtkOverlayAdapter,
	#superclass : #GtkLayoutAdapter,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #private }
GtkOverlayAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [ 
	
	| childWidget |
	childWidget := aPresenter buildWithSpec: constraints spec.
	constraints isOverlay
		ifFalse: [
			aWidget add: childWidget ]
		ifTrue: [
			childWidget
				beHAlignCenter;
				beVAlignCenter.
			aWidget addOverlay: childWidget ].
	^ aWidget
]

{ #category : #building }
GtkOverlayAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #private }
GtkOverlayAdapter >> doLayout: aLayout [

	widget := GtkOverlay new.
	self connectToEvents: aLayout. 
	widget showAll.
]
