Extension { #name : #TextColor }

{ #category : #'*Mars-Tools' }
TextColor >> acceptTag: aTag [

	aTag foreground: self color
]
