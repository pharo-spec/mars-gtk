Extension { #name : #TextEmphasis }

{ #category : #'*Mars-Spec-Text' }
TextEmphasis >> acceptTag: aTag [
	aTag perform: self attributeSelector 
]

{ #category : #'*Mars-Spec-Text' }
TextEmphasis >> attributeSelector [ 
	^ self attributeSelectors at: emphasisCode 
]

{ #category : #'*Mars-Spec-Text' }
TextEmphasis >> attributeSelectors [
	^  {   	
		1	-> #beBold.
		2	-> #beItalic.
		4	-> #beUnderlined.
		8	-> #beNarrow.
		16	-> #beStrikeThrough } asDictionary 
]
