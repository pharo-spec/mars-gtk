Class {
	#name : #GtkSliderAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkSliderAdapter >> addModelTo: gtkWidget [
	super addModelTo: gtkWidget.
	gtkWidget drawValue: false.
	gtkWidget setValue: self presenter value.
	gtkWidget marks: self presenter marks.
	self presenter
		whenMarksChangedDo: [ :newValue | self marks: newValue into: gtkWidget ].
	self presenter
		whenValueChangedDo: [ :newValue | gtkWidget setValue: newValue ]
]

{ #category : #building }
GtkSliderAdapter >> marks: newValue into: gtkWidget [
	gtkWidget clearMarks.
	newValue
		do: [ :m | 
			gtkWidget
				addMarkAtValue: (self presenter scaleValue: m value)
				withPosition: GtkPositionType GTK_POS_BOTTOM
				withText: m text ]
]

{ #category : #building }
GtkSliderAdapter >> newWidget [
	^ self presenter isHorizontal
		ifTrue: [ self widgetClass
				newHorizontalMin: 0
				max: 1
				step: (self presenter quantum / self presenter max) asFloat ]
		ifFalse: [ self widgetClass
				newVerticalMin: 0
				max: 1
				step: (self presenter quantum / self presenter max) asFloat ]
]

{ #category : #building }
GtkSliderAdapter >> widgetClass [
	^ GtkScale 
]
