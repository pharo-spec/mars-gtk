Extension { #name : #TextColor }

{ #category : #'*Mars-Spec-Code' }
TextColor >> acceptTag: aTag [

	aTag foreground: self color
]
