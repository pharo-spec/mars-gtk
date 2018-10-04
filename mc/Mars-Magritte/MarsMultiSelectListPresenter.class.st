Class {
	#name : #MarsMultiSelectListPresenter,
	#superclass : #MarsListPresenter,
	#category : 'Mars-Magritte'
}

{ #category : #'private building' }
MarsMultiSelectListPresenter >> buildEditorWidget [
	^ GtkScrolledWindow new 
		sizeRequest: -1@(self class defaultLineHeight * self class defaultOptionsCount);
		borderWidth: self class defaultBorderWidth;		
		add: (GtkListBox new 
			addAll: (self options collect: [ :object | self buildLabelFor: object]);
			yourself);
		yourself
]

{ #category : #'private building' }
MarsMultiSelectListPresenter >> buildLabelFor: anObject [ 
	^ (GtkLabel newLabel: (self toString: anObject))
		data: anObject;
		yourself
]

{ #category : #private }
MarsMultiSelectListPresenter >> toString: anObject [
	^ self magritteDescription reference toString: anObject
]
