Class {
	#name : #GtkWidgetSignal,
	#superclass : #GtkSignal,
	#instVars : [
		'widget'
	],
	#category : 'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkWidgetSignal class >> emitWidget: aWidget [
	^ (self newWidget: aWidget) emit
]

{ #category : #'instance creation' }
GtkWidgetSignal class >> newWidget: aWidget [
	^ self new widget: aWidget
]

{ #category : #printing }
GtkWidgetSignal >> printOneLineContentsOn: stream [
	stream print: self widget; << '('; print: self widget getHandle; << ')'
]

{ #category : #accessing }
GtkWidgetSignal >> widget [
	^ widget
]

{ #category : #accessing }
GtkWidgetSignal >> widget: anObject [
	widget := anObject
]
