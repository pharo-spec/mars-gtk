Class {
	#name : #StApplication,
	#superclass : #GtkApplication,
	#instVars : [
		'platform'
	],
	#category : #'Mars-Tools'
}

{ #category : #initialization }
StApplication >> initialize [

	super initialize.
	platform := StPlatform newForPlatform
]

{ #category : #'private running' }
StApplication >> installTheme [

	GtkSettings default themeName: self platform defaultTheme
]

{ #category : #accessing }
StApplication >> platform [ 

	^ platform
]

{ #category : #'private running' }
StApplication >> start [
	super start.
	self installTheme
]
