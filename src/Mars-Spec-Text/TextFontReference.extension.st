Extension { #name : #TextFontReference }

{ #category : #'*Mars-Spec-Text' }
TextFontReference >> acceptTag: aTag [
	aTag
		fontFamily: font familyName 
		size: font pointSize
		weight: font weightValue  
]
