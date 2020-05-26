Extension { #name : #KeyboardKey }

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F1 [
	
	^ self value: 65470
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F10 [
	
	^ self value: 65479
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F11 [
	
	^ self value: 65480
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F12 [
	
	^ self value: 65481
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F2 [
	
	^ self value: 65471
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F3 [
	
	^ self value: 65472
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F4 [
	
	^ self value: 65473
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F5 [
	
	^ self value: 65474
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F6 [
	
	^ self value: 65475
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F7 [
	
	^ self value: 65476
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F8 [
	
	^ self value: 65477
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey class >> F9 [
	
	^ self value: 65478
]

{ #category : #'*Mars-Spec-Keybindings' }
KeyboardKey >> asKeyCombination [

	^ KMSingleKeyCombination from: (Character value: self value)
]
