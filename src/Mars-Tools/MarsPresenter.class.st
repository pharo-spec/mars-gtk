Class {
	#name : #MarsPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'menuHolder',
		'toolbarHolder',
		'statusBarHolder'
	],
	#category : #'Mars-Tools'
}

{ #category : #'initialization - private' }
MarsPresenter >> initializePrivateValueHolders [

	super initializePrivateValueHolders.	
	menuHolder := nil asValueHolder.
	toolbarHolder := nil asValueHolder.
	statusBarHolder := nil asValueHolder
]

{ #category : #api }
MarsPresenter >> menu [
	^ menuHolder value
]

{ #category : #api }
MarsPresenter >> menu: aPresenter [
	menuHolder value: aPresenter
]

{ #category : #api }
MarsPresenter >> statusBar [
	^ toolbarHolder value
]

{ #category : #api }
MarsPresenter >> statusBar: aPresenter [
	toolbarHolder value: aPresenter
]

{ #category : #api }
MarsPresenter >> toolbar [
	^ toolbarHolder value
]

{ #category : #api }
MarsPresenter >> toolbar: aPresenter [
	toolbarHolder value: aPresenter
]
