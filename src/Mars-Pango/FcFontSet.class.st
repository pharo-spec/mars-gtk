Class {
	#name : #FcFontSet,
	#superclass : #FcObject,
	#category : #'Mars-Pango-FontConfig'
}

{ #category : #printing }
FcFontSet >> printToStdout [

	^ self ffiCall: #(void FcFontSetPrint(self))
]
