Class {
	#name : #GtkMorphViewTest,
	#superclass : #TestCase,
	#instVars : [
		'morph',
		'view'
	],
	#category : #'Mars-Gtk-Morphic-Tests'
}

{ #category : #tests }
GtkMorphViewTest >> morphForTest [

	^ (self 
		newGridOf: 10 
		with: [ Morph new ])
		extent: 500@500;
		yourself
]

{ #category : #tests }
GtkMorphViewTest >> newGridOf: aNumber with: aBlock [
	| gridMorph |

	(gridMorph := Morph new)
		color: Color transparent;
		layoutPolicy: TableLayout new;
		borderWidth: 10;
		cellInset: 10;
		listDirection: #topToBottom;
		vResizing: #spaceFill; 
		hResizing: #spaceFill.

	1 to: aNumber do: [ :y | | row |
		row := (Morph new color: Color transparent).
		row
			layoutPolicy: TableLayout new;
			listDirection: #leftToRight;
			cellInset: 10;
			vResizing: #spaceFill; 
			hResizing: #spaceFill.
		1 to: aNumber do: [ :x | |  cell |
			cell := aBlock cull: x@y.
			cell
				vResizing: #spaceFill; 
				hResizing: #spaceFill. 
			row addMorphBack: cell ].
		gridMorph addMorphBack: row ].
	
	^ gridMorph
]

{ #category : #running }
GtkMorphViewTest >> setUp [
	
	morph := self morphForTest.
	morph openInWorld.
	view := GtkMorphView basicNew
]

{ #category : #running }
GtkMorphViewTest >> tearDown [
	
	super tearDown.
	morph delete
]

{ #category : #tests }
GtkMorphViewTest >> testIntersectingMorphsChildMorph [
	
	self 
		assert: (view intersectingMorphs: morph within: morph submorphs third fullBounds)
		equals: { morph submorphs third } asOrderedCollection
]

{ #category : #tests }
GtkMorphViewTest >> testIntersectingMorphsDeepChildFullMorph [
	
	self 
		assert: (view 
			intersectingMorphs: morph 
			within: (morph submorphs third submorphs third fullBounds expandBy: 10@0))
		equals: { morph submorphs third } asOrderedCollection
]

{ #category : #tests }
GtkMorphViewTest >> testIntersectingMorphsDeepChildMorph [
	
	self 
		assert: (view intersectingMorphs: morph within: morph submorphs third submorphs third fullBounds)
		equals: { morph submorphs third submorphs third } asOrderedCollection
]

{ #category : #tests }
GtkMorphViewTest >> testIntersectingMorphsFullMorph [
	
	self 
		assert: (view intersectingMorphs: morph within: morph fullBounds)
		equals: { morph }.
	
]

{ #category : #tests }
GtkMorphViewTest >> testIntersectingMorphsFullMorphPartialRectangle [
	
	self 
		assert: (view intersectingMorphs: morph within: (0@0 corner: 500@1000))
		equals: { morph }
]
