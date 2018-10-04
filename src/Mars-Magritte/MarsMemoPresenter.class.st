"
I'm a presenter for memo texts (text areas... I'm not sure my name is accurate or just a remaining of ancient times (memo comes from html).
Anyway, identity name problems aside, I show an editable text area.
"
Class {
	#name : #MarsMemoPresenter,
	#superclass : #MarsElementPresenter,
	#instVars : [
		'innerEditorWidget'
	],
	#category : 'Mars-Magritte'
}

{ #category : #private }
MarsMemoPresenter >> acceptEdition [
	"Because editorWidget is in fact a ScrolledWindow"
	self string: innerEditorWidget text
]

{ #category : #'private building' }
MarsMemoPresenter >> buildEditorWidget [
	^ GtkScrolledWindow new 
		sizeRequest: -1@(self magritteDescription lineCount * self class defaultLineHeight);
		borderWidth: self class defaultBorderWidth;
		add: (innerEditorWidget := GtkTextView new text: self string);
		yourself
]

{ #category : #'private building' }
MarsMemoPresenter >> buildViewWidget [
	^ self buildEditorWidget editable: false
]

{ #category : #private }
MarsMemoPresenter >> resetEdition [
	innerEditorWidget text: self string
]

{ #category : #accessing }
MarsMemoPresenter >> string: aString [ 
	^ super string: (aString ifNil: [ '' ])
]
