answering
answer: anObject
	| didUserCancel |

	didUserCancel := anObject isNil.
	didUserCancel | answerBlock isNil ifTrue: [ ^ self ].

	answerBlock value: anObject.