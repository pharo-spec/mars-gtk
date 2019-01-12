Class {
	#name : #ImageTableColumn,
	#superclass : #TableColumn,
	#category : #'Mars-Tools-Inspector'
}

{ #category : #visiting }
ImageTableColumn >> acceptColumnBuilder: aBuilder [

	^ aBuilder visitImageColumn: self
]
