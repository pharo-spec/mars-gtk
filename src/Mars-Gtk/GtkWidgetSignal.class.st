"
I'm a generic widget signal.
"
Class {
	#name : #GtkWidgetSignal,
	#superclass : #GtkSignal,
	#instVars : [
		'widget'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkWidgetSignal class >> emitWidget: aWidget [

	^ (self newWidget: aWidget) emit
]

{ #category : #'instance creation' }
GtkWidgetSignal class >> newWidget: aWidget [
	^ self new widget: aWidget
]

{ #category : #testing }
GtkWidgetSignal >> isFiltered [

	^ super isFiltered 
		and: [ (self isTracing: self widget) not ]
]

{ #category : #printing }
GtkWidgetSignal >> printOneLineContentsOn: stream [
	
	stream
		<< self widget className  
		<< ' ' << self widget getHandle printString
]

{ #category : #accessing }
GtkWidgetSignal >> widget [
	^ widget
]

{ #category : #accessing }
GtkWidgetSignal >> widget: anObject [
	widget := anObject
]
