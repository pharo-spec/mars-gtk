"
I signal a widget has connect to a gtk signal.
"
Class {
	#name : #GtkConnectSignalSignal,
	#superclass : #GtkWidgetSignal,
	#instVars : [
		'signal'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkConnectSignalSignal class >> emitWidget: aWidget signal: aName [

	^ (self 
		newWidget: aWidget 
		signal: aName)
		emit
]

{ #category : #'instance creation' }
GtkConnectSignalSignal class >> newWidget: aWidget signal: aName [

	^ (self newWidget: aWidget)
		signal: aName;
		yourself
]

{ #category : #printing }
GtkConnectSignalSignal >> printOneLineContentsOn: stream [
	
	super printOneLineContentsOn: stream.
	stream << ' ' << self signal
]

{ #category : #accessing }
GtkConnectSignalSignal >> signal [
	^ signal
]

{ #category : #accessing }
GtkConnectSignalSignal >> signal: anObject [
	signal := anObject
]
