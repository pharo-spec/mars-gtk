Class {
	#name : #MorphicTableDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'Mars-Tools-Inspector'
}

{ #category : #accessing }
MorphicTableDataSource >> cellColumn: column row: rowIndex [

	^ FTCellMorph new
		addMorphBack: (column readString: (self elementAt: rowIndex)) asMorph;
		yourself
]
