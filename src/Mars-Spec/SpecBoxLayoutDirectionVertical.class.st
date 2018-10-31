Class {
	#name : #SpecBoxLayoutDirectionVertical,
	#superclass : #SpecBoxLayoutDirection,
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #factory }
SpecBoxLayoutDirectionVertical >> newWidgetOn: anAdapter [

	^ anAdapter newVertical
]
