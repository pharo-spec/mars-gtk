Class {
	#name : #MorphicTableAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #'Mars-Tools-Inspector'
}

{ #category : #factory }
MorphicTableAdapter >> addModelTo: tableMorph [
	
	self model columns do: [ :each |
		tableMorph addColumn: (MorphicTableColumn on: each) ].
	
	tableMorph dataSource: (MorphicTableDataSource new 
		elements: self model items;
		yourself)
]

{ #category : #factory }
MorphicTableAdapter >> buildWidget [
	| tableMorph |
	
	tableMorph := FTTableMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself.
	self addModelTo: tableMorph.
	^ tableMorph
]
