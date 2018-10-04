"
I'm a presenter for buttons to be included in MarsContainerPresenter.

"
Class {
	#name : #MarsButtonPresenter,
	#superclass : #Object,
	#instVars : [
		'widget',
		'icon',
		'label',
		'action'
	],
	#category : 'Mars-Magritte'
}

{ #category : #'instance creation' }
MarsButtonPresenter class >> label: aString action: aBlock [
	^ self label: aString icon: nil action: aBlock
]

{ #category : #'instance creation' }
MarsButtonPresenter class >> label: aString icon: aForm action: aBlock [
	^ self new 
		label: aString;
		icon: aForm;
		action: aBlock;
		yourself
]

{ #category : #accessing }
MarsButtonPresenter >> action [
	^ action
]

{ #category : #accessing }
MarsButtonPresenter >> action: anObject [
	action := anObject
]

{ #category : #'private building' }
MarsButtonPresenter >> buildWidgetOn: aContainer [
	| newButton |
	
	newButton := GtkButton newLabel: self label.
	newButton connectClicked: [ self action value: aContainer ].
	self icon ifNotNil: [ 
		newButton
			alwaysShowImage: true;
			image: (GtkImage newForm: self icon) ].

	^ newButton
]

{ #category : #accessing }
MarsButtonPresenter >> icon [
	^ icon
]

{ #category : #accessing }
MarsButtonPresenter >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
MarsButtonPresenter >> label [
	^ label
]

{ #category : #accessing }
MarsButtonPresenter >> label: anObject [
	label := anObject
]

{ #category : #accessing }
MarsButtonPresenter >> widgetOn: aContainer [
	^ widget ifNil: [ widget := self buildWidgetOn: aContainer ]
]
