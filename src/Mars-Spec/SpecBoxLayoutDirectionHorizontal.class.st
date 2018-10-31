Class {
	#name : #SpecBoxLayoutDirectionHorizontal,
	#superclass : #SpecBoxLayoutDirection,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #factory }
SpecBoxLayoutDirectionHorizontal >> newWidgetOn: anAdapter [

	^ anAdapter newHorizontal
]
