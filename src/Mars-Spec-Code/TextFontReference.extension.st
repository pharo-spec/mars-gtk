Extension { #name : #TextFontReference }

{ #category : #'*Mars-Spec-Code' }
TextFontReference >> acceptTag: aTag [
	aTag
		fontFamily: font familyName 
		size: font pointSize
		weight: font weightValue  
]
