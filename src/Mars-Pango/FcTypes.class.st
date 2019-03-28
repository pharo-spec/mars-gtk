Class {
	#name : #FcTypes,
	#superclass : #SharedPool,
	#classVars : [
		'FcBool',
		'FcChar8'
	],
	#category : #'Mars-Pango-FontConfig'
}

{ #category : #initialization }
FcTypes >> initialize [

	FcChar8 := #char.
	FcBool := #Boolean
]
