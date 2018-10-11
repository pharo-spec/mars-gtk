Class {
	#name : #MarsApplication,
	#superclass : #GtkApplication,
	#instVars : [
		'platform'
	],
	#category : #'Mars-Tools'
}

{ #category : #initialization }
MarsApplication >> initialize [

	super initialize.
	platform := MarsPlatform newForPlatform
]

{ #category : #'private running' }
MarsApplication >> installTheme [

	GtkSettings default themeName: self platform defaultTheme
]

{ #category : #accessing }
MarsApplication >> platform [ 

	^ platform
]

{ #category : #'private running' }
MarsApplication >> start [
	super start.
	self installTheme
]
