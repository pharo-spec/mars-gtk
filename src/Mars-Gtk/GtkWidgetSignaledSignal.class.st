"
I signal a widget has received a gtk signal for which it was suscribed.
"
Class {
	#name : #GtkWidgetSignaledSignal,
	#superclass : #GtkSignal,
	#instVars : [
		'signal'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkWidgetSignaledSignal class >> emitSignal: aString [

	^ (self newSignal: aString) emit
]

{ #category : #'instance creation' }
GtkWidgetSignaledSignal class >> newSignal: aString [

	^ self new signal: aString
]

{ #category : #printing }
GtkWidgetSignaledSignal >> printOneLineContentsOn: stream [
	
	stream << self signal
		
]

{ #category : #accessing }
GtkWidgetSignaledSignal >> signal [
	^ signal
]

{ #category : #accessing }
GtkWidgetSignaledSignal >> signal: anObject [
	signal := anObject
]
