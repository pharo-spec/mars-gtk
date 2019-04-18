Extension { #name : #TextColor }

{ #category : #'*Mars-Spec-Text' }
TextColor >> acceptTag: aTag [

	aTag foreground: self color
]
